import 'dart:async';
import 'package:bolt/helpers/http_request.dart';
import 'package:bolt/helpers/location_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:google_maps_webservice/directions.dart';
import 'package:google_maps_webservice/places.dart';
import '../models/bolt.dart';

class AppData extends ChangeNotifier {
  bool locationServicesActive = true;
  // this is the key object - the PolylinePoints
  // which generates every polyline between start and finish
  PolylinePoints polylinePoints = PolylinePoints();
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: GOOGLE_API_KEY);

  static const LatLng _center = const LatLng(33.738045, 73.084488);

  List<LatLng> _polylineCoordinates = [];
  List<LatLng> get polylineCoordinates => _polylineCoordinates;
  set polylineCoordinates(List<LatLng> val) {
    _polylineCoordinates = val;
    notifyListeners();
  }

  Set<Polyline> _polylines = {};
  Set<Polyline> get polylines => _polylines;
  set polylines(Set<Polyline> val) {
    _polylines = val;
    notifyListeners();
  }

  Set<Marker> _markers = {};
  Set<Marker> get markers => _markers;

  set markers(Set<Marker> val) {
    _markers = val;
    notifyListeners();
  }

  final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.4279, -122.0857),
    zoom: 12,
  );

  Completer<GoogleMapController> controllerGoogleMap = Completer();
  final geoLocator = Geolocator();

  final pickUpTEC = TextEditingController();
  final destinationTEC = TextEditingController();

  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  final searchScaffoldKey = GlobalKey<ScaffoldState>();

  String get encodedPoly => null;

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(response.errorMessage)));
  }

  Position _currentPosition;
  Position get currentPosition => _currentPosition;
  set currentPosition(Position val) {
    _currentPosition = val;
    notifyListeners();
  }

  double _bottomPaddingOfMap = 0;
  double get bottomPaddingOfMap => _bottomPaddingOfMap;
  set bottomPaddingOfMap(double val) {
    _bottomPaddingOfMap = val;
    notifyListeners();
  }

  Bolt _pickUpLocation;
  Bolt get pickUpLocation => _pickUpLocation;
  set pickUpLocation(Bolt val) {
    _pickUpLocation = val;
    notifyListeners();
  }

  Bolt _dropOffLocation;
  Bolt get dropOffLocation => _dropOffLocation;
  set dropOffLocation(Bolt val) {
    _dropOffLocation = val;
    notifyListeners();
  }

  void updatePickUpLocationAddress(Bolt pickUpAddress) {
    pickUpLocation = pickUpAddress;
    print(pickUpLocation);
    notifyListeners();
  }

  void dropOffLocationAddress(Bolt dropOffAddress) {
    pickUpLocation = dropOffAddress;
    print(dropOffLocation);
    notifyListeners();
  }

  void locatePosition() async {
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final latLatPosition =
        LatLng(currentPosition.latitude, currentPosition.longitude);

    final coordinates =
        new Coordinates(currentPosition.latitude, currentPosition.longitude);
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    pickUpTEC.text = addresses.first.addressLine;
  }

  Future<void> handlePressButton(BuildContext context) async {
    Prediction p = await PlacesAutocomplete.show(
      context: context,
      apiKey: GOOGLE_API_KEY,
      onError: onError,
      mode: Mode.overlay,
      language: "en",
    );

    displayPrediction(p, homeScaffoldKey.currentState, encodedPoly, context);
  }

  Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold,
      String encodedPoly, BuildContext context) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;
      final place = LatLng(lat, lng);

      destinationTEC.text = p.description;
      polylines = {};
      markers = {};
      markers.add(Marker(
        markerId: MarkerId(p.placeId),
        position: place,
        infoWindow: InfoWindow(
          title: p.description,
          snippet: 'Pickup',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      markers.add(Marker(
        markerId: MarkerId(p.placeId),
        position: place,
        infoWindow: InfoWindow(
          title: pickUpTEC.text,
          snippet: 'Destination'
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));

      var result = await polylinePoints?.getRouteBetweenCoordinates(
        GOOGLE_API_KEY,
        PointLatLng(
          currentPosition.latitude,
          currentPosition.longitude,
        ),
        PointLatLng(
          lat,
          lng,
        ),
      );

      if (result.points.isNotEmpty) {
        // loop through all PointLatLng points and convert them
        // to a list of LatLng, required by the Polyline
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      }

      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline _ = Polyline(
        polylineId: PolylineId("poly"),
        startCap: Cap.roundCap,
        endCap: Cap.roundCap,
        jointType: JointType.round,
        width: 3,
        points: polylineCoordinates,
      );
      print(polylineCoordinates);

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      polylines = {_};

      Navigator.pop(context);
    }
  }

  void findPlace(String placeName) async {
    if (placeName.length > 1) {
      String autoCompleteUrl =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$GOOGLE_API_KEY&sessiontoken=1234567890&components=country:ng";
      var res = await RequestAssistance.getRequest(autoCompleteUrl);
      if (res == "failed") {
        return;
      }
      print(res);
    }
  }
}

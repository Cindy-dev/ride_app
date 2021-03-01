import 'dart:async';

import 'package:bolt/helpers/http_request.dart';
import 'package:bolt/helpers/location_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import '../models/bolt.dart';

class AppData extends ChangeNotifier {
  GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: GOOGLE_API_KEY);

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

  void updatePickUpLocationAddress(Bolt pickUpAddress) {
    pickUpLocation = pickUpAddress;
    print(pickUpLocation);
    notifyListeners();
  }

  void locatePosition() async {
    currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    final latLatPosition =
        LatLng(currentPosition.latitude, currentPosition.longitude);

    final coordinates = new Coordinates(1.10, 45.50);
    final addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
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

    displayPrediction(p, homeScaffoldKey.currentState);
  }

  Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
    if (p != null) {
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;

      destinationTEC.text = p.description;
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

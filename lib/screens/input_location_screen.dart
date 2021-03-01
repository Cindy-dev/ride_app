import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import '../providers/app_data.dart';
import '../helpers/location_helpers.dart';
import '../helpers/http_request.dart';
import '../screens/screens1.dart';

class InputLocation extends StatefulWidget {
  static const routeName = 'inputlocation';
  @override
  _InputLocationState createState() => _InputLocationState();
}

final homeScaffoldKey = GlobalKey<ScaffoldState>();
final searchScaffoldKey = GlobalKey<ScaffoldState>();

GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: GOOGLE_API_KEY);

class _InputLocationState extends State<InputLocation> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  final pickUpTEC = TextEditingController();
  final destinationTEC = TextEditingController();
  Position currentPosition;
  final geoLocator = Geolocator();
  double bottomPaddingOfMap = 0;
  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition =
        new CameraPosition(target: latLatPosition, zoom: 14);
    //newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(response.errorMessage)));
  }

  Mode _mode = Mode.overlay;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: homeScaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                      onTap: () {
                        Navigator.popAndPushNamed(context, Screen1.routeName);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        'Enter pick-up location',
                        style: TextStyle(
                            fontFamily: 'Sofia Pro',
                            fontSize: 20,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 0.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextField(
                          cursorHeight: 25,
                          cursorColor: Colors.green.shade400,
                          decoration: InputDecoration(
                            filled: true,
                            hintText: 'Enter pick-up location',
                            hintStyle: TextStyle(fontWeight: FontWeight.w300),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black26,
                            )),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              width: 2,
                              color: Colors.black26,
                            )),
                            border: InputBorder.none,
                            fillColor: Colors.white12,
                          ),
                          controller: pickUpTextEditingController),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: ListTile(
                        leading: Icon(
                          Icons.location_on,
                          color: Colors.deepPurple.shade700,
                          size: 20,
                        ),
                        title: GestureDetector(
                          onTap: () => _handlePressButton(),
                          child: AbsorbPointer(
                            child: TextField(
                              cursorHeight: 25,
                              cursorColor: Colors.green.shade400,
                              decoration: InputDecoration(
                                hintText: 'Enter destination',
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.w300),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.black26,
                                )),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.black26,
                                )),
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white24,
                              ),
                              controller: destinationTextEditingController,
                              onChanged: (val) {
                                findPlace(val);
                              },
                            ),
                          ),
                        ),
                        trailing: GestureDetector(
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Provider.of<AppData>(context).pickUpLocation != null
                  ? Provider.of<AppData>(context).pickUpLocation.placeName
                  : Card(
                      elevation: 0.2,
                      child: ListTile(
                          leading: Icon(Icons.home),
                          title: Text('Enter home location')),
                    ),
              Card(
                elevation: 0.2,
                child: ListTile(
                    leading: Icon(Icons.home_repair_service_outlined),
                    title: Text('Enter work location')),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_searching,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Choose on map'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handlePressButton() async {
    Prediction p = await PlacesAutocomplete.show(
      context: context,
      apiKey: GOOGLE_API_KEY,
      onError: onError,
      mode: _mode,
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

      setState(() {
        destinationTEC.text = p.description;
      });

      scaffold.showSnackBar(
        SnackBar(content: Text("${p.description} - $lat/$lng")),
      );
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

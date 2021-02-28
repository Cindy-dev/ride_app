import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../widget/main_drawer.dart';
import '../screens/input_location_screen.dart';

class Screen1 extends StatefulWidget {
  static const routeName = 'Screen1';

  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  Completer<GoogleMapController>_controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.4279, -122.0857),
    zoom: 12,
  );
  GlobalKey<ScaffoldState>scaffoldKey= new GlobalKey<ScaffoldState>();

  Position currentPosition;
  var geoLocator = Geolocator();
  double bottomPaddingOfMap = 0;

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latlatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition = new CameraPosition(
      target:latlatPosition,
      zoom: 14
    );
    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        drawer: MainDrawer(),
        backgroundColor: Colors.white,
        body:   Stack(
          children:[ 
            GoogleMap( 
              padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              compassEnabled: true,
              onMapCreated: (GoogleMapController controller){
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;
                locatePosition();
                setState(() {
                  bottomPaddingOfMap = 300.0;
                });
                locatePosition();
              },
              initialCameraPosition: _kGooglePlex,
              myLocationEnabled: true,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
            ),
            Positioned(
              top: 45.0,
              left: 22.0,
              child: GestureDetector(
                onTap: (){
                  scaffoldKey.currentState.openDrawer();
                },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      //blurRadius: 6,
                      //spreadRadius: 0.15,
                      offset: Offset(0.7, 0.7),    
                    )
                  ]
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.menu, color: Colors.black,),
                  radius: 20.0,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: Container(
              height: 230, 
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft:Radius.circular(18), topRight: Radius.circular(18)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 6,
                    spreadRadius: 0.15,
                    offset: Offset(0.7, 0.7),
                  )
                ],
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: (){},
                    child: Icon(
                      Icons.drag_handle, 
                      size: 20,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: Text('Nice to see you!')
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(25, 0, 0, 10),
                    child: Text(
                      'Where are you going?', 
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Sofia Pro',
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacementNamed(InputLocation.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Card(elevation: 3, 
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(10,10,0,20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max, 
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(Icons.search, 
                              color: Colors.black,
                              size: 26,
                            ),
                            Text(
                              'Search destination',
                              style: TextStyle(
                                fontSize: 19,
                                fontFamily: 'Avenir'
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],),
      ),
    );
  }                        
}
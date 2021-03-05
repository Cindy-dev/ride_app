import 'package:bolt/providers/app_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/screens1.dart';

class InputLocation extends StatefulWidget {
  static const routeName = 'inputlocation';
  @override
  _InputLocationState createState() => _InputLocationState();
}

class _InputLocationState extends State<InputLocation> {
  AppData get appData => Provider.of<AppData>(context, listen: false);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppData>(context);
    return SafeArea(
      child: Scaffold(
        key: provider.homeScaffoldKey,
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
              Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  elevation: 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextField(
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
                          controller: provider.pickUpTEC,
                        ),
                        Row(children: [
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 18, 0, 0),
                              child: Icon(
                                Icons.location_on,
                                color: Colors.black54,
                                size: 20,
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 10,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(15, 18, 0, 0),
                              child: GestureDetector(
                                onTap: (){
                                  provider.handlePressButton(context);
                                //  Navigator.pushReplacementNamed(context,Screen1.routeName);  
                                },
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
                                    controller: provider.destinationTEC,
                                     onChanged: (val) {
                                      provider.findPlace(val);
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 18, 5, 0),
                              child: GestureDetector(
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
              // Provider.of<AppData>(context).pickUpLocation != null
              //     ? Provider.of<AppData>(context).pickUpLocation.placeName
              //     : Card(
              //         elevation: 0.2,
              //         child: ListTile(
              //             leading: Icon(Icons.home),
              //             title: Text('Enter home location')),
              //       ),
              // Card(
              //   elevation: 0.2,
              //   child: ListTile(
              //       leading: Icon(Icons.home_repair_service_outlined),
              //       title: Text('Enter work location')),
              // ),
              // SpacingHeight(530),
              // Card(
              //   child: Padding(
              //     padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Icon(
              //           Icons.location_searching,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Text('Choose on map'),
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

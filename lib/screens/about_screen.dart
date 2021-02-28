import 'package:flutter/material.dart';
import '../screens/screens1.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = 'aboutscreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            child: Row(children: [
              GestureDetector(
                child: Icon(Icons.arrow_back, color: Colors.black,),
                onTap: (){Navigator.of(context).pushReplacementNamed(Screen1.routeName);}, 
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text('About Bolt',
                  style: TextStyle(
                    fontFamily: 'Sofia Pro',
                    fontSize: 20,
                    color: Colors.black 
                  ),
                ),
              )
            ],),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Divider(
                    color: Colors.black12,thickness:1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10), 
                    child: Text('Rate app',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Avenir',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black12,thickness:1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10),
                    child: Text('Facebook',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Avenir',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black12,thickness:1,
                  ),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Divider(
                    color: Colors.black12,thickness:1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10),
                    child: Text('Solutions for work rides',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Avenir',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black12,thickness:1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:10),
                    child: Text('Bolt Careers',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Avenir',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black12,thickness:1,
                  ),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 10), 
                child:Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Divider( 
                      color: Colors.black12,thickness:1,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10),
                      child: Text('Terms and Conditions', 
                        textDirection: TextDirection.ltr, 
                        textAlign: TextAlign.start, 
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Avenir',
                            fontSize: 20,
                          ),
                        ),
                    ),
                    Divider(
                     color: Colors.black12,thickness:1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],),
      ),
    );
  }
}
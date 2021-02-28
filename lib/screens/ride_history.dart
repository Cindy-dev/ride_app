import 'package:flutter/material.dart';
import '../screens/screens1.dart';

class RideHistory extends StatelessWidget {
  static const routeName = 'ridehistory';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: 100,
          width: double.infinity, 
          padding: const EdgeInsets.all(10),
          child: Row(children: [
            GestureDetector(
              child: Icon(Icons.arrow_back, color: Colors.black,),
              onTap: (){Navigator.of(context).pushReplacementNamed(Screen1.routeName);}, 
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Ride History',
                style: TextStyle( 
                  fontFamily: 'Sofia Pro',
                  fontSize: 20,
                  color: Colors.black 
                ),
              ),
            )
          ],),
        ),
      ),
    );
  }
}
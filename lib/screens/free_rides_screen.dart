import 'package:flutter/material.dart';
import '../screens/screens1.dart';

class FreeRides extends StatelessWidget {
  static const routeName = 'freerides';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container( 
          height: 100,
          width: double.infinity, 
          padding: const EdgeInsets.all(8),
          child: Row(children: [
            GestureDetector(
              child: Icon(Icons.arrow_back, color: Colors.black,),
              onTap: ()=>Navigator.of(context).pushReplacementNamed(Screen1.routeName) 
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text('Free Rides',
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
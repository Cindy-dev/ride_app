import 'package:flutter/material.dart';
import '../screens/screens1.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = 'profile';
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container(
          child:
            Column(children: [
              Container(
                height: 100,
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      GestureDetector(
                        child: Icon(Icons.arrow_back, color: Colors.black,),
                        onTap: (){Navigator.of(context).pushReplacementNamed(Screen1.routeName );}, 
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('Profile',
                          style: TextStyle(
                            fontFamily: 'Sofia Pro',
                            fontSize: 20,
                            color: Colors.black 
                          ),
                        ),
                      )
                    ],),
                  GestureDetector(child: Text('Log Out', style: TextStyle(fontSize: 15),)),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                //leading: //fb
                  title: Container( 
                    height: 50,
                    alignment: Alignment.center,
                    child: Text('CONNECT TO FACEBOOK',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.blue.shade700,
                  )
                ),
              ),
              Card(
                elevation: 0.2,
                child: ListTile(
                  leading:Icon(Icons.home),
                  title: Column(
                    children: [
                      Text( 
                        'Home'
                      ),
                      Text( 
                        'Enter home location'
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.edit),
                ),
              ),
              Card(
                elevation: 0.2,
                child: ListTile(
                  leading:Icon(Icons.home_repair_service_outlined),
                  title: Column(
                    children: [
                      Text( 
                        'Enter home location'
                      ),
                      Text('Enter work location'),
                    ],
                  ),
                  trailing: Icon(Icons.edit
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
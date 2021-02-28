import 'package:flutter/material.dart';
import '../screens/screens1.dart';

class SupportScreen extends StatelessWidget {
  static const routeName = 'suportscreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:AppBar(
          title: Row(
            mainAxisAlignment:MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(child: Icon(
                Icons.arrow_back, color: Colors.black,),
                onTap: (){
                  Navigator.popAndPushNamed(context, Screen1.routeName);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('Support',
                  style: TextStyle(
                    fontFamily: 'Sofia Pro',
                    fontSize: 20,
                    color: Colors.black 
                  ),
                ),
              ),
            ],),
            backgroundColor: Colors.white,
            elevation: 0.5,
          ),
          body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: ListTile(
              leading: Text(
                'Support', 
                style: TextStyle(
                  color: Colors.grey
                ),
              ),
              trailing: Icon(
                Icons.search, 
                color: Colors.grey,
              ),  
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(25,5,0,10),
            child: Text(
              'Conversations', 
              style: TextStyle(
                color:Colors.grey,
              ),
             // textAlign: TextAlign.start,
            ),
          ),
          Padding(
         //   alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(5), 
            child: Card(
              elevation: 1,
                child: ListTile(
                leading: Text('Your conversations'),
                trailing: Icon(Icons.navigate_next),
              ),
            ),
          ),
        ],),
      ),
    );
  }
}
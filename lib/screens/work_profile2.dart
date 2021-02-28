import 'package:flutter/material.dart';
import '../widget/custom_button.dart';

class WorkProfile2 extends StatelessWidget {
  static const routeName = 'workprofile2';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child:Container(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,    
              children:[
                Flexible(
                  flex: 1,
                  child: Row(children: [
                    Icon(Icons.arrow_back, color: Colors.black,),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('Work Profile',
                        style: TextStyle(
                          fontFamily: 'Sofia Pro',
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],),
                ),
                Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Where should we send receipts when you ride for work?',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w500,
                          ),              
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Your work email',
                            hintStyle: TextStyle(fontWeight: FontWeight.w300),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.green,
                              )
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.green,
                              )
                            ),
                            border: InputBorder.none,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                        width: 300,
                        child: CustomButtton(text:'Next',)
                      ),
                    ]
                  ),
                ),
              ]
            ),
          ), 
        ),
      ),
    );
  }
}
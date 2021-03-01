import 'package:flutter/material.dart';
import '../screens/screens1.dart';
import '../widget/custom_button.dart';

class Promotions extends StatelessWidget {
  static const routeName = 'promotions';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                    height: 100,
                    width: double.infinity, 
                    padding: const EdgeInsets.all(8),
                    child: Row(children: [
                      GestureDetector(child: Icon(
                        Icons.arrow_back, color: Colors.black,),
                        onTap: (){
                          Navigator.popAndPushNamed(context, Screen1.routeName);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('Promotions',
                          style: TextStyle(
                            fontFamily: 'Sofia Pro',
                            fontSize: 20,
                            color: Colors.black 
                          ),
                        ),
                      )
                    ],),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 100, left: 100), 
                    child: TextField(
                      textAlign: TextAlign.center,
                      cursorHeight: 30,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        hintText: 'promo code',
                        hintStyle:TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 25
                        ),
                      ),
                    ), 
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      'Enter the code and it will be applied to your next ride.',
                      style: (
                        TextStyle(
                          fontSize: 18,
                          fontFamily: 'Avenir'
                        )
                      ),
                    ),
                  )
                ],
              ),
              CustomButtton(text:'APPLY')
            ],
          ),
        ),
      ),
    );
  }
}
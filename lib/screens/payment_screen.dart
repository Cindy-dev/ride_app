import 'package:flutter/material.dart';
import '../screens/new_card_screen.dart';
import '../screens/screens1.dart';

class PaymentScreen extends StatelessWidget {
  static const routeName = 'paymentscreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(20),
              child: GestureDetector(
                child: Icon(Icons.arrow_back, color: Colors.black,),
                onTap: (){
                  Navigator.popAndPushNamed(context, Screen1.routeName);
                },
              )
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(20),
              child: Text('Payments',
                style: TextStyle(
                  fontFamily: 'Sofia Pro',
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black 
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5,20, 0, 10),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Promotions',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Avenir',
                        fontSize: 15, 
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black12,thickness:1,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5,0,0,20), 
                    child: Row(
                      children: [ 
                        Icon(Icons.card_giftcard, color: Colors.black26,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Enter promo code',
                            style: TextStyle(
                             color: Colors.black,
                             fontFamily: 'Avenir',
                             fontSize: 17,
                            ),
                          ),
                        ),
                      ]
                    ),
                  ),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text('Profile option',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.black12,thickness:1,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5,0,0,20), 
                    child: GestureDetector(
                         onTap: (){Navigator.of(context).pushNamed(NewCardScreen.routeName);},
                        child: Row(
                        children: [ 
                          Icon(Icons.edit, color: Colors.black26,), 
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Edit profile',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Avenir',
                              fontSize: 17,
                            ),
                          ) ,
                        ),
                      ]),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ],),
      ),
    );
  }
}
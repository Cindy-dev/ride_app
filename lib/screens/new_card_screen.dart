import 'package:flutter/material.dart';
import '../models/app_colors.dart';
import '../screens/payment_screen.dart';
import '../widget/custom_button.dart';

class NewCardScreen extends StatelessWidget {
  static const routeName = 'newcard';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Column(children: [
                  Container(
                    height: 100,
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    child: Row(children: [
                      GestureDetector(
                        child: Icon(Icons.arrow_back, color: Colors.black,),
                        onTap: (){Navigator.of(context).pushReplacementNamed(PaymentScreen.routeName);}, 
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text('New card',
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
                    padding: const EdgeInsets.fromLTRB(20,0,20,0),
                    child: TextField(
                      cursorHeight: 25,
                      cursorColor: Colors.green.shade400,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.payment,color: Colors.black,),
                        ),
                        suffixIcon: Padding( 
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.camera_alt_outlined, color: Colors.black,),
                        ),
                        filled: true,
                        hintText: 'Enter pick-up location',
                        hintStyle: TextStyle(fontWeight: FontWeight.w300),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black26,
                          )
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black26,
                          ),
                        ),
                        border: InputBorder.none,
                        fillColor: Colors.white12,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15,18,5,0),
                            child: TextField(
                            cursorHeight: 15,
                            cursorColor: Colors.green.shade400,
                            decoration: InputDecoration(
                              filled: true,
                              hintText: 'Expire date',
                              hintStyle: TextStyle(fontWeight: FontWeight.w300),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.designColor,
                                )
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                //width: 2,
                                  color: Colors.black26,
                                )
                              ),
                              border: InputBorder.none,
                              fillColor: Colors.white12,
                            ),
                        ),
                          ),
                      ),
                      Flexible(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5,18,15,0), 
                            child: TextField(
                              cursorHeight: 15,
                              cursorColor: Colors.green.shade400,
                              decoration: InputDecoration(
                              filled: true, 
                              hintText: 'Secure code',
                              hintStyle: TextStyle(fontWeight: FontWeight.w300),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.designColor, 
                                )
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  //  width: 2,
                                  color: Colors.black26,
                                )
                              ),
                              border: InputBorder.none,
                              fillColor: Colors.white12,
                            ),
                        ),
                          ),
                      ),
                    ],),
                  ],),
                  Container( 
                    alignment: Alignment.center, 
                    padding: EdgeInsets.fromLTRB(
                      16, MediaQuery.of(context).size.height / 1.66, 
                      16, 5),
                      child: Row(
                        children: [
                          Text('Bolt may charge a small amount to confirm your card details. This is immediately refunded.',
                        style: TextStyle(fontSize: 10)
                      ),
                      GestureDetector(child: 
                      Text('Learn more',
                        style: TextStyle(fontSize: 10, color: AppColors.designColor),
                      ),
                      ),
                    ],
                  ),
                ),

                CustomButtton(text: 'ADD CARD', width: MediaQuery.of(context).size.width -30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
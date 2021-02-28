import 'package:flutter/material.dart';
import '../widget/custom_button.dart';

class WorkProfile1 extends StatelessWidget {
  static const routeName = 'workprofile';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,          
            children: [
            Flexible(
              flex:1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,    
                mainAxisSize: MainAxisSize.min,
                children: [ 
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.arrow_back),
                  ),
                ],
              ),
            ),
            Container(
              child: Image.asset('assets/images/images (2).png', fit: BoxFit.cover,),
            ),
            Flexible(
              flex: 2, 
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 25,40,70),
                child: Column(
                  children: [
                    Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                       'Work Profile',
                        style: TextStyle(
                          color: Colors.black, 
                          fontFamily: 'Sofia Pro', 
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                         'Get receipts to your email for easy expensing',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 175, 0, 0),
                        width: 300,
                        child: CustomButtton(
                          text:'GET STARTED', 
                        ),
                     ),
                   ],
                  ),                    
                ],),
              ),
            ),
          ],),
        ),
      ),
    );
  }
}
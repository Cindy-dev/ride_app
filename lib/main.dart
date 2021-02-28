import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/app_data.dart';
import './screens/Profile_Screen.dart';
import './screens/about_screen.dart';
import './screens/free_rides_screen.dart';
import './screens/input_location_screen.dart';
import './screens/new_card_screen.dart';
import './screens/payment_screen.dart';
import './screens/promotions_screen.dart';
import './screens/ride_history.dart';
import './screens/screens1.dart';
import './screens/support_screen.dart';
import './screens/work_profile1_screen.dart';
import './screens/work_profile2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context) => AppData(),
      child: MaterialApp(
        debugShowCheckedModeBanner:false,
        title: 'Flutter Demo',
        color: Colors.white,
        home:Screen1(), 
        routes: {
          Screen1.routeName:(ctx)=>Screen1(),
          NewCardScreen.routeName: (ctx) => NewCardScreen(),
          ProfileScreen.routeName:(ctx) => ProfileScreen(),
          InputLocation.routeName: (ctx) => InputLocation(),
          WorkProfile2.routeName: (ctx)=> WorkProfile2(),
          WorkProfile1.routeName: (ctx)=> WorkProfile1(),
          SupportScreen.routeName: (ctx) => SupportScreen(),
          Promotions.routeName: (ctx) => Promotions(),
          PaymentScreen.routeName: (ctx) => PaymentScreen(),
          AboutScreen.routeName:(ctx) => AboutScreen(),
          FreeRides.routeName:(ctx) => FreeRides(),
          RideHistory.routeName: (ctx) => RideHistory(),
        },
      ),
    );
  }
}

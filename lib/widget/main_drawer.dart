import 'package:flutter/material.dart';
import '../models/app_colors.dart';
import '../screens/Profile_Screen.dart';
import '../screens/about_screen.dart';
import '../screens/free_rides_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/promotions_screen.dart';
import '../screens/ride_history.dart';
import '../screens/support_screen.dart';
import '../widget/custom_button.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
        leading: Icon(
          icon,
          size: 26,
          color: AppColors.designColor3,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'Avenir',
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: AppColors.designColor3,
          ),
        ),
        onTap: tapHandler);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(children: <Widget>[
          Flexible(
            flex: 7,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 40, 20, 40),
                color: Colors.white,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.designColor,
                        child: Icon(
                          Icons.person,
                          color: AppColors.designColor5,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ProfileScreen.routeName);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cynthia',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: AppColors.designColor3,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              'View profile',
                              style: TextStyle(
                                fontSize: 11,
                                color: AppColors.designColor3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
              buildListTile('Payments', Icons.payment, () {
                Navigator.of(context)
                    .pushReplacementNamed(PaymentScreen.routeName);
              }),
              buildListTile('Free rides', Icons.favorite_outline, () {
                Navigator.of(context).pushReplacementNamed(FreeRides.routeName);
              }),
              buildListTile('Ride history', Icons.access_time, () {
                Navigator.of(context)
                    .pushReplacementNamed(RideHistory.routeName);
              }),
              buildListTile('Promotions', Icons.card_giftcard, () {
                Navigator.of(context)
                    .pushReplacementNamed(Promotions.routeName);
              }),
              buildListTile('Support', Icons.chat, () {
                Navigator.of(context)
                    .pushReplacementNamed(SupportScreen.routeName);
              }),
              buildListTile('About', Icons.info_outline, () {
                Navigator.of(context)
                    .pushReplacementNamed(AboutScreen.routeName);
              }),
            ]),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: CustomButtton(
                text: 'SIGN UP TO DRIVE',
                width: 550,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

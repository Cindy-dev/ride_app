import 'package:flutter/material.dart';
import '../models/bolt.dart';

class AppData extends ChangeNotifier{
  Bolt pickUpLocation;

  void updatePickUpLocationAddress(Bolt pickUpAddress){
    pickUpLocation = pickUpAddress;
    print("1");
    print(pickUpLocation);
    notifyListeners();
  }
}
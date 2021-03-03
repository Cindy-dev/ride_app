import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../models/bolt.dart';
import '../providers/app_data.dart';
import '../helpers/location_helpers.dart';
import '../helpers/http_request.dart';

class HelperMethods{
  static Future<String>searchCordinateAddress(Position position, context)async{
    String placeAddress = "";    
    String st1, st2, st3, st4;
    String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$GOOGLE_API_KEY";

    var response = await RequestAssistance.getRequest(url);

    if(response != 'failed'){
      print('3');
      print(response);
      //placeAddress
       st1= response["results"][0]["address_components"][0]["long_name"];
       st2= response["results"][0]["address_components"][1]["long_name"];
       st3 = response["results"][0]["address_components"][5]["long_name"];
       st4 = response["results"][0]["address_components"][6]["long_name"];

       placeAddress = st1 + ", " + st2 + ", " + st3 + ", " + st4;
      Bolt userPickUpAddress = new Bolt();
      userPickUpAddress.longitude = position.longitude;
      userPickUpAddress.latitude = position.latitude;
      userPickUpAddress.placeName = placeAddress;

      Provider.of<AppData>(context, listen: false).updatePickUpLocationAddress(userPickUpAddress);
    }

    return placeAddress;
  }

  static Future <String> obtainDirectionsDetail(LatLng initialPosition, LatLng finalPosition) async{
    String directionUrl = "https://maps.googleapis.com/maps/api/directions/json?origin=${initialPosition.latitude},${initialPosition.longitude}&destination=${finalPosition.latitude},${finalPosition.longitude}&key=$GOOGLE_API_KEY";

    http.Response response = await http.get(directionUrl);
    Map values = jsonDecode(response.body);
    return values["routes"][0]["overview_polyline"]["points"];
    //var res = await RequestAssistance.getRequest(directionUrl);

  //   if(res == "failed")
  //   {
  //     return null;
  //   }

  //     DirectionDetails directionDetails = DirectionDetails();

  //     directionDetails.encodedPoints = res["routes"][0]["overview_polyline"]["points"];

  //     directionDetails.distanceText = res["routes"][0]["legs"][0]["distance"]["text"];
  //     directionDetails.distanceValue = res["routes"][0]["legs"][0]["distance"]["value"];

  //     directionDetails.durationText = res["routes"][0]["legs"][0]["duration"]["text"];
  //     directionDetails.durationValue = res["routes"][0]["legs"][0]["duration"]["value"];

  //     return directionDetails;
   }
}
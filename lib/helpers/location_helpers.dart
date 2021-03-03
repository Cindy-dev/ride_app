
const GOOGLE_API_KEY = 'AIzaSyBrkjJ2ZHYWu0lJr2zm7xb8pDz2gBaJ-dU';

class LocationHelpers{
  static String generateLocationPreviewImage({double latitude, double longitude}){
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&Zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }
}
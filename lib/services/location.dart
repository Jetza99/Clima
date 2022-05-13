import 'package:geolocator/geolocator.dart';

class Location {

  double lat = 0.0;
  double long = 0.0;

  Future<void> getCurrentLocation() async{
    try {

      LocationPermission permission;
      permission = await Geolocator.checkPermission();

      if(permission == LocationPermission.denied){
        await Geolocator.requestPermission();
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      lat = position.latitude;
      long = position.longitude;

    } catch (e) {
      print(e);
    }
  }


}

import 'package:geolocator/geolocator.dart';

String distanceBetween(double lat1, double long1, double lat2, double long2) {
  final meter = Geolocator.distanceBetween(lat1, long1, lat2, long2);
  final km = meter / 1000;

  return '${km.toStringAsFixed(2)} km';
}

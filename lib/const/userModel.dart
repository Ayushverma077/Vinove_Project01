import 'dart:math';

class UserModel {
  String name;
  String lastSeen;
  bool isActive;
  double latitude;
  String firstSeen;

  double longitude;

  UserModel({
    required this.lastSeen,
    required this.firstSeen,
    required this.name,
    required this.isActive,
    required this.latitude,
    required this.longitude,
  });

  double distanceTo(double lat, double lng) {
    const double earthRadius = 6371;
    double dLat = _degreeToRadian(latitude - lat);
    double dLng = _degreeToRadian(longitude - lng);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreeToRadian(lat)) *
            cos(_degreeToRadian(latitude)) *
            sin(dLng / 2) *
            sin(dLng / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double _degreeToRadian(double degree) {
    return degree * pi / 180;
  }
}

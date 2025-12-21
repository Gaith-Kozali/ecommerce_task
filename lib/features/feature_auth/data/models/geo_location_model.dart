import '../../domain/entities/geo_location.dart';

class GeoLocationModel extends GeoLocation {
  GeoLocationModel({required super.lat, required super.long});

  factory GeoLocationModel.fromJson(Map<String, dynamic> json) {
    return GeoLocationModel(
      lat: json['lat'] as String,
      long: json['long'] as String,
    );
  }
}

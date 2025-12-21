import '../../domain/entities/address.dart';
import 'geo_location_model.dart';

class AddressModel extends Address {
  AddressModel({
    required super.city,
    required super.street,
    required super.number,
    required super.zipcode,
    required super.geoLocation,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      city: json['city'],
      street: json['street'],
      number: json['number'],
      zipcode: json['zipcode'],
      geoLocation: GeoLocationModel.fromJson(json['geolocation']),
    );
  }
}

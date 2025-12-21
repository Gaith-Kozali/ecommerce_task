import 'geo_location.dart';

class Address {
  final String city;
  final String street;
  final int number;
  final String zipcode;
  final GeoLocation geoLocation;

  const Address({
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
    required this.geoLocation,
  });
}

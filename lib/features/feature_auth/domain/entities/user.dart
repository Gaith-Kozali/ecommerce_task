import 'address.dart';

class User {
  final int? id;
  final String userName;
  final String email;
  final String password;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final Address? address;

  const User({
    this.id,
    required this.userName,
    required this.email,
    required this.password,
    this.firstName,
    this.lastName,
    this.phone,
    this.address,
  });
}

import '../../domain/entities/user.dart';
import 'address_model.dart';

class UserModel extends User {
  UserModel({
    super.id,
    required super.userName,
    required super.email,
    required super.password,
    super.firstName,
    super.lastName,
    super.phone,
    super.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userName: json['username'],
      email: json['email'],
      password: json['password'],
      firstName: json['name']['firstname'],
      lastName: json['name']['lastname'],
      phone: json['phone'],
      address: AddressModel.fromJson(json['address']),
    );
  }
  Map<String, dynamic> toJson() {
    return {'username': userName, 'email': email, 'password': password};
  }
}

part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignInEvent extends AuthEvent {
  SignInEvent({required this.userName, required this.password});
  final String userName;
  final String password;
}

class SignUpEvent extends AuthEvent {
  SignUpEvent({
    required this.userName,
    required this.email,
    required this.password,
  });
  final String userName;
  final String email;
  final String password;
}

class SignOutEvent extends AuthEvent {}

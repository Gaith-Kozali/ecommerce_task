part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthNoneState extends AuthState {}

// SignIn state
class SignInSuccess extends AuthState {}

class SignInProgress extends AuthState {}

class SignInError extends AuthState {
  SignInError({required this.failure});
  final Failure failure;
}

// SignUp state
class SignUpSuccess extends AuthState {}

class SignUpProgress extends AuthState {}

class SignUpError extends AuthState {
  SignUpError({required this.failure});
  final Failure failure;
}

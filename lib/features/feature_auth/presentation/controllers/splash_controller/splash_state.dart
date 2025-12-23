part of 'splash_cubit.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashProgress extends SplashState {}

class SplashAuthenticated extends SplashState {}

class SplashUnAuthenticated extends SplashState {}

class SplashError extends SplashState {
  final Failure failure;
  SplashError(this.failure);
}

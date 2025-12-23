import 'package:bloc/bloc.dart';
import 'package:ecommerce_task/core/utils/failure.dart';
import 'package:ecommerce_task/features/feature_auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_task/features/feature_auth/presentation/controllers/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final AuthRepository authRepository;
  final AuthBloc authBloc;

  SplashCubit({required this.authRepository, required this.authBloc})
    : super(SplashInitial());

  Future<void> startApp() async {
    emit(SplashProgress());
    if (authRepository.getLoginStatus()) {
      final result = await authRepository.getUserInfo();
      result.fold((failure) => emit(SplashError(failure)), (userInf) {
        authBloc.user = userInf;
        emit(SplashAuthenticated());
      });
    } else {
      emit(SplashUnAuthenticated());
    }
  }
}

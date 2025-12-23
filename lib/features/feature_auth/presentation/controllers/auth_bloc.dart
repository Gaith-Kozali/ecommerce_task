import 'package:bloc/bloc.dart';
import 'package:ecommerce_task/core/utils/failure.dart';
import 'package:ecommerce_task/features/feature_auth/data/models/user_model.dart';
import 'package:ecommerce_task/features/feature_auth/domain/entities/user.dart';
import 'package:ecommerce_task/features/feature_auth/domain/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

import '../../data/data_source/auth_local_data.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;
  AuthLocalData authLocalData;
  User? user;
  AuthBloc({required this.authRepository, required this.authLocalData})
    : super(AuthNoneState()) {
    on<SignInEvent>(signIn);
    on<SignUpEvent>(signUp);
    on<SignOutEvent>(signOut);
    on<FetchUserInf>(getUserInf);
  }
  signIn(SignInEvent event, emit) async {
    emit(SignInProgress());
    final data = await authRepository.getUserToken(
      event.userName,
      event.password,
    );
    data.fold(
      (l) => emit(SignInError(failure: l)),
      (user) {
        this.user= user;
        emit(SignInSuccess());
      } ,
    );
  }

  signUp(SignUpEvent event, emit) async {
    emit(SignUpProgress());
    final data = await authRepository.signUpUser(
      UserModel(
        userName: event.userName,
        email: event.email,
        password: event.password,
      ),
    );
    data.fold(
      (l) => emit(SignUpError(failure: l)),
      (_) => emit(SignUpSuccess()),
    );
  }

  signOut(SignOutEvent event, emit) async {
    await authLocalData.clearTokens();
    emit(AuthNoneState());
  }

  getUserInf(FetchUserInf event, emit) async {
    emit(FetchUserInfProgress());
    final result = await authRepository.getUserInfo();
    result.fold(
      (failure) => emit(FetchUserInfError(failure: failure)),
      (userInf) {
        user = userInf;
        emit(FetchUserInfSuccess());
      } ,
    );
  }
}

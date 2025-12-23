import 'package:ecommerce_task/core/sevices/app_route.dart';
import 'package:ecommerce_task/core/sevices/network_service.dart';
import 'package:ecommerce_task/features/feature_auth/presentation/controllers/splash_controller/splash_cubit.dart';
import 'package:ecommerce_task/features/feature_home/data/data_source/product_remote_data.dart';
import 'package:ecommerce_task/features/feature_home/data/repositories_imp/product_repository_imp.dart';
import 'package:ecommerce_task/features/feature_home/domain/repositories/product_repository.dart';
import 'package:ecommerce_task/features/feature_home/presentation/controllers/cart_controller/cart_cubit.dart';
import 'package:ecommerce_task/features/feature_home/presentation/controllers/product_controller/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/feature_auth/data/data_source/auth_local_data.dart';
import '../../features/feature_auth/data/data_source/auth_remote_data.dart';
import '../../features/feature_auth/data/repositories_imp/auth_repository_imp.dart';
import '../../features/feature_auth/domain/repositories/auth_repository.dart';
import '../../features/feature_auth/presentation/controllers/auth_bloc.dart';

final getIt = GetIt.instance;
Future<void> setupInjection() async {
  final prefs = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(prefs);
  getIt.registerLazySingleton<AuthLocalData>(() => AuthLocalData(getIt()));
  getIt.registerLazySingleton<NetworkService>(() => NetworkService());
  getIt.registerLazySingleton<AuthRemoteData>(() => AuthRemoteData(getIt()));

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(authRemoteData: getIt(), authLocalData: getIt()),
  );
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(authRepository: getIt(), authBloc: getIt()),
  );
  getIt.registerLazySingleton<AuthBloc>(
    () => AuthBloc(authRepository: getIt(), authLocalData: getIt()),
  );
  // >>>>>>>>>>> product Bloc
  getIt.registerLazySingleton<ProductRemoteData>(
    () => ProductRemoteData(getIt()),
  );
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImp(productRemoteData: getIt()),
  );
  getIt.registerFactory<ProductBloc>(
    () => ProductBloc(productRepository: getIt()),
  );
  getIt.registerFactory<CartCubit>(() => CartCubit());
}

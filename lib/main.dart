import 'package:ecommerce_task/core/sevices/app_route.dart';
import 'package:ecommerce_task/core/constants/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/bloc_observer.dart';
import 'core/sevices/injection.dart';
import 'features/feature_auth/presentation/controllers/auth_bloc.dart';
import 'features/feature_home/presentation/controllers/cart_controller/cart_cubit.dart';
import 'features/feature_home/presentation/controllers/product_controller/product_bloc.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjection();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  if (kIsWeb){
    usePathUrlStrategy();
  }
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => getIt<AuthBloc>()),
            BlocProvider(create: (context) => getIt<ProductBloc>()),
            BlocProvider(create: (context) => getIt<CartCubit>()),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'E-Market',
            theme: AppTheme.lightMode,
            routerConfig: AppRoute.routerConfig,
          ),
        );
      },
    );
  }
}

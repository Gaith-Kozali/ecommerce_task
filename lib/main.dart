import 'package:ecommerce_task/core/sevices/app_route.dart';
import 'package:ecommerce_task/core/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'core/bloc_observer.dart';
import 'core/sevices/injection.dart';
import 'features/feature_auth/presentation/controllers/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjection();
  usePathUrlStrategy();
  runApp(const MyApp());
  Bloc.observer = MyBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [BlocProvider(create: (context) => getIt<AuthBloc>())],
          child: MaterialApp.router(
            title: 'E-Market',
            theme: AppTheme.lightMode,
            routerConfig: AppRoute.routerConfig,
          ),
        );
      },
    );
  }
}

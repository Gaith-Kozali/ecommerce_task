import 'package:ecommerce_task/features/feature_auth/data/data_source/auth_local_data.dart';
import 'package:ecommerce_task/features/feature_auth/presentation/pages/splash_page.dart';
import 'package:ecommerce_task/features/feature_home/domain/entities/product.dart';
import 'package:ecommerce_task/features/feature_home/presentation/pages/cart_page.dart';
import 'package:ecommerce_task/features/feature_home/presentation/pages/home_page.dart';
import 'package:ecommerce_task/features/feature_home/presentation/pages/product_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../features/feature_auth/domain/entities/user.dart';
import '../../features/feature_auth/domain/repositories/auth_repository.dart';
import '../../features/feature_auth/presentation/controllers/splash_controller/splash_cubit.dart';
import '../../features/feature_auth/presentation/pages/signin_page.dart';
import '../../features/feature_auth/presentation/pages/signup_page.dart';
import '../../features/feature_home/presentation/pages/user_profile_page.dart';
import 'injection.dart';

class AppRoute {
  // static late AuthLocalData authLocalData;
  //
  // static void init(AuthLocalData localData) {
  //   authLocalData = localData;
  // }

  static RouterConfig<Object>? routerConfig = GoRouter(
    initialLocation: SplashPage.route,
    routes: [
      GoRoute(
        path: SplashPage.route,
        builder:
            (context, state) => BlocProvider(
              create: (context) => getIt<SplashCubit>(),
              child: SplashPage(),
            ),
      ),
      GoRoute(
        path: SignInPage.route,
        builder: (context, state) => SignInPage(),
      ),
      GoRoute(
        path: SignupPage.route,
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(path: HomePage.route, builder: (context, state) => HomePage()),
      GoRoute(
        path: ProductDetailsPage.route,
        pageBuilder: (context, state) {
          final product = state.extra as Product;
          return CustomTransitionPage(
            key: state.pageKey,
            transitionDuration: const Duration(milliseconds: 400),
            child: ProductDetailsPage(product: product),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        },
      ),
      GoRoute(path: CartPage.route, builder: (context, state) => CartPage()),
      GoRoute(
        path: UserProfilePage.route,
        builder:
            (context, state) => UserProfilePage(user: (state.extra) as User?),
      ),
    ],
  );
}

import 'package:ecommerce_task/features/feature_home/domain/entities/product.dart';
import 'package:ecommerce_task/features/feature_home/presentation/pages/home_page.dart';
import 'package:ecommerce_task/features/feature_home/presentation/pages/product_details_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/feature_auth/presentation/pages/signin_page.dart';
import '../../features/feature_auth/presentation/pages/signup_page.dart';

class AppRoute {
  static RouterConfig<Object>? routerConfig = GoRouter(
    initialLocation: HomePage.route,
    routes: [
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
    ],
  );
}

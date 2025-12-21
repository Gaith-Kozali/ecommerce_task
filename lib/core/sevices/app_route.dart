import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../features/feature_auth/presentation/pages/signin_page.dart';
import '../../features/feature_auth/presentation/pages/signup_page.dart';

class AppRoute {
  static RouterConfig<Object>? routerConfig = GoRouter(
    initialLocation: SignInPage.route,
    routes: [
      GoRoute(
        path: SignInPage.route,
        builder: (context, state) => SignInPage(),
      ),
      GoRoute(
        path: SignupPage.route,
        builder: (context, state) => SignupPage(),
      ),
    ],
  );
}

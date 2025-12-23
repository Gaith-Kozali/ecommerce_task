import 'package:ecommerce_task/core/app_progress_message.dart';
import 'package:ecommerce_task/core/constants/assets_path.dart';
import 'package:ecommerce_task/core/utils/screen_information.dart';
import 'package:ecommerce_task/features/feature_auth/presentation/pages/signin_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../feature_home/presentation/pages/home_page.dart';
import '../controllers/splash_controller/splash_cubit.dart';

class SplashPage extends StatefulWidget {
  static const route = '/';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        Duration(seconds: 4),
      ).then((_) => context.read<SplashCubit>().startApp());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          print("state state state \n \n \n \n BlocListener $state");
          if (state is SplashAuthenticated) {
            context.go(HomePage.route);
          }
          if (state is SplashUnAuthenticated) {
            context.go(SignInPage.route);
            debugPrint("SplashPage SplashPage \n\n $state");
          }
          if (state is SplashError) {
            AppProgressMessage.errorMessage(
              context,
              message: "Some error happen",
            ).then((value) => context.go(SignInPage.route));
          }
        },
        child: Center(
          child: Lottie.asset(
            AssetsPath.splashImage,
            width: getScreenWidth(context) * 0.6,
            height: getScreenWidth(context) * 0.6,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

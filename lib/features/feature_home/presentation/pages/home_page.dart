import 'dart:math';
import 'package:ecommerce_task/core/app_progress_message.dart';
import 'package:ecommerce_task/core/constants/app_size.dart';
import 'package:ecommerce_task/core/constants/app_spacing.dart';
import 'package:ecommerce_task/core/enum.dart';
import 'package:ecommerce_task/core/utils/screen_information.dart';
import 'package:ecommerce_task/features/feature_auth/presentation/controllers/auth_bloc.dart';
import 'package:ecommerce_task/features/feature_auth/presentation/pages/signin_page.dart';
import 'package:ecommerce_task/features/feature_home/presentation/controllers/product_controller/product_bloc.dart';
import 'package:ecommerce_task/features/feature_home/presentation/widgets/custom_appbar.dart';
import 'package:ecommerce_task/features/feature_home/presentation/widgets/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../domain/entities/product.dart';
import '../widgets/animation_product_card.dart';
import '../widgets/search_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppSize appSize = AppSize();
  late ProductBloc _productBloc;
  late AuthBloc _authBloc;
  bool isDesktop = false;
  @override
  void initState() {
    super.initState();
    _productBloc = BlocProvider.of<ProductBloc>(context);
    _authBloc = BlocProvider.of<AuthBloc>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _productBloc.add(FetchAllProduct());
      // if(_authBloc.user ==null){
      //   _authBloc.add(FetchUserInf());
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    isDesktop = AppBreakpoints.isDesktop(getScreenWidth(context));
    return MultiBlocListener(
      listeners: [
        BlocListener<ProductBloc, ProductState>(
          listener:
              (context, state) =>
                  (state.statusAPI == StatusAPI.error)
                      ? AppProgressMessage.errorSnackMessage(
                        context,
                        state.failure!.message,
                      )
                      : SizedBox(),
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthNoneState) {
              context.go(SignInPage.route);
            }
          },
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          drawer: CustomNavigationBar(appSize: appSize, user: _authBloc.user),
          body: Row(
            children: [
              if (isDesktop)
                CustomNavigationBar(appSize: appSize, user: _authBloc.user),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    if (!isDesktop) CustomAppbar(appSize: appSize),
                    BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                        if (state.statusAPI == StatusAPI.loading) {
                          return SliverFillRemaining(
                            child: AppProgressMessage.primaryProgress,
                          );
                        }
                        return SliverPadding(
                          padding: AppSpacing.allMedium,
                          sliver: SliverList(
                            delegate: SliverChildListDelegate([
                              SearchBarWidget(
                                appSize: appSize,
                                products: state.products,
                              ),
                              AppSpacing.columnLarge,
                              const SizedBox(height: 12),
                              _buildProductsGrid(context, state.products),
                            ]),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductsGrid(BuildContext context, List<Product> products) {
    double screenWidth = getScreenWidth(context);
    final crossAxisCount =
        AppBreakpoints.isDesktop(screenWidth)
            ? 4
            : AppBreakpoints.isTablet(screenWidth)
            ? 3
            : 2;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 16,
        crossAxisSpacing: min(16.w, 32),
        childAspectRatio:
            AppBreakpoints.isDesktop(screenWidth)
                ? 0.7
                : AppBreakpoints.isTablet(screenWidth)
                ? 0.6
                : 0.5,
      ),
      itemBuilder: (context, index) {
        return AnimatedProductCard(
          appSize: appSize,
          product: products[index],
          index: index,
        );
      },
    );
  }
}

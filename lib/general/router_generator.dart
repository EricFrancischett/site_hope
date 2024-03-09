import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:site_hope/features/home/view/about_page.dart';
import 'package:site_hope/features/home/view/blog_page.dart';
import 'package:site_hope/features/home/view/home_page.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/custom_app_bar/custom_app_bar.dart';
import 'package:site_hope/general/custom_app_bar/custom_app_bar_mobile.dart';
import 'package:site_hope/general/custom_scroll_keys.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/widgets/app_footer.dart';

class RouterGenerator {
  static final GoRouter router = GoRouter(
    routes: [
      // ShellRoute(
      //   builder: (BuildContext context, GoRouterState state, Widget child) {
      //     return _buildShellRoute(
      //       context,
      //       child,
      //     );
      //   },
      //   routes: <RouteBase>[
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return buildAnimation(
            state,
            const HomePage(),
          );
        },
      ),
      GoRoute(
        path: '/about',
        pageBuilder: (context, state) {
          return buildAnimation(
            state,
            const AboutPage(),
          );
        },
      ),
      GoRoute(
        path: '/blog',
        pageBuilder: (context, state) {
          return buildAnimation(
            state,
            const BlogPage(),
          );
        },
      ),
      // ],
      // ),
    ],
  );
}

CustomTransitionPage buildAnimation(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    name: state.fullPath,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}

Widget _buildShellRoute(BuildContext context, Widget child) {
  final resolution = Resolutions.getResolution(context: context);
  return Scaffold(
    backgroundColor: AppColors.hopeWhite,
    body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(
              resolution == CurrentResolution.isWeb ? 40 : 30,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: resolution != CurrentResolution.isCellPhone
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: resolution != CurrentResolution.isCellPhone,
                      child: Container(
                        width: 98,
                        height: 48,
                        color: AppColors.hopeOrange,
                      ),
                    ),
                    const Text(
                      'Faça a sua reserva (41) 99641-2016',
                      style: TextStyle(
                        color: AppColors.hopeGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                if (resolution != CurrentResolution.isCellPhone) ...{
                  CustomAppBar(
                    ticketsKey: CustomScrollKeys.ticketsKey,
                    hotelsKey: CustomScrollKeys.hotelsKey,
                    packagesKey: CustomScrollKeys.packagesKey,
                  ),
                } else ...{
                  CustomAppBarMobile(
                    ticketsKey: CustomScrollKeys.ticketsKey,
                    hotelsKey: CustomScrollKeys.hotelsKey,
                    packagesKey: CustomScrollKeys.packagesKey,
                  ),
                },
              ],
            ),
          ),
          child,
          const SizedBox(
            height: 80,
          ),
          AppFooter(
            resolution: resolution,
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(
                resolution == CurrentResolution.isWeb ? 40 : 30,
              ),
              child: Text(
                'Todos os direitos reservados para o site HOPE Viagens © 2024${resolution == CurrentResolution.isWeb ? '  |  ' : '\n'}Site desenvolvido por: Turbo Design.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.hopeGrey,
                  fontSize: 14,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

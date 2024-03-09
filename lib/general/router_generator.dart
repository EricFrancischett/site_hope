import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:site_hope/features/home/view/about_page.dart';
import 'package:site_hope/features/home/view/blog_page.dart';
import 'package:site_hope/features/home/view/home_page.dart';

class RouterGenerator {
  static final GoRouter router = GoRouter(
    routes: [
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

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:site_hope/features/home/view/about_page.dart';
import 'package:site_hope/features/home/view/blog_page.dart';
import 'package:site_hope/features/home/view/carrent_page.dart';
import 'package:site_hope/features/home/view/home_page.dart';
import 'package:site_hope/features/home/view/hotels_page.dart';

class RouterGenerator {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          final meta = MetaSEO();
          meta.ogTitle(ogTitle: 'Hope Viagens');
          meta.ogDescription(
            ogDescription:
                'Passagens aéreas, pacotes nacionais e internacionais, hotéis e pousadas.',
          );
          meta.keywords(
            keywords:
                'Hope Viagens, Passagens aéreas, Pacotes nacionais, Pacotes internacionais, Hotéis, Pousadas',
          );
          return buildAnimation(
            state,
            const HomePage(),
          );
        },
      ),
      GoRoute(
        path: '/sobre',
        pageBuilder: (context, state) {
          final meta = MetaSEO();
          meta.ogTitle(ogTitle: 'Sobre nós - Hope Viagens');
          meta.ogDescription(
            ogDescription:
                'Conheça a história da Hope Viagens e saiba mais sobre nossos serviços.',
          );
          meta.keywords(
            keywords: 'Hope Viagens, Sobre nós, História, Serviços, Viagens',
          );
          return buildAnimation(
            state,
            const AboutPage(),
          );
        },
      ),
      GoRoute(
        path: '/blog',
        pageBuilder: (context, state) {
          final meta = MetaSEO();
          meta.ogTitle(ogTitle: 'Blog - Hope Viagens');
          meta.ogDescription(
            ogDescription:
                'Blog da Hope Viagens com dicas de viagens, destinos e muito mais.',
          );
          meta.keywords(
            keywords: 'Hope Viagens, Blog, Dicas de viagens, Destinos, Viagens',
          );
          return buildAnimation(
            state,
            const BlogPage(),
          );
        },
      ),
      GoRoute(
        path: '/aluguel-carros',
        pageBuilder: (context, state) {
          final meta = MetaSEO();
          meta.ogTitle(ogTitle: 'Aluguel de carros - Hope Viagens');
          meta.ogDescription(
            ogDescription:
                'Aluguel de carros com a Hope Viagens. Reserve já o seu veículo!',
          );
          meta.keywords(
              keywords: 'Hope Viagens, Aluguel de carros, Reserva de veículos');
          return buildAnimation(
            state,
            const CarRentPage(),
          );
        },
      ),
      GoRoute(
        path: '/hotels',
        pageBuilder: (context, state) {
          final meta = MetaSEO();
          meta.ogTitle(ogTitle: 'Hotéis - Hope Viagens');
          meta.ogDescription(
            ogDescription:
                'Hotéis e pousadas com a Hope Viagens. Reserve já a sua estadia!',
          );
          meta.keywords(
              keywords: 'Hope Viagens, Hotéis, Pousadas, Reserva de estadia');
          return buildAnimation(
            state,
            const HotelsPage(),
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

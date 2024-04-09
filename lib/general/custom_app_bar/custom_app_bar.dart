import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/custom_app_bar/app_bar_button.dart';
import 'package:site_hope/general/custom_app_bar/pages_enum.dart';
import 'package:site_hope/general/custom_scroll_keys.dart';
import 'package:site_hope/general/image_constants.dart';

class CustomAppBar extends StatelessWidget {
  final PagesEnum currentPage;
  const CustomAppBar({
    super.key,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.hopeOrange,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    if (currentPage != PagesEnum.home) {
                      context.go('/');
                    }
                  },
                  child: SvgPicture.asset(
                    ImageConstants.hopeSimbolo,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              AppBarButton(
                text: 'Hotéis',
                onTap: () {
                  if (currentPage != PagesEnum.home) {
                    context.go('/');
                    Future.delayed(
                      const Duration(milliseconds: 500),
                    ).then((value) {
                      Scrollable.ensureVisible(
                        CustomScrollKeys.hotelsKey.currentContext!,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
                      );
                    });
                  } else {
                    Scrollable.ensureVisible(
                      CustomScrollKeys.hotelsKey.currentContext!,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
                    );
                  }
                },
              ),
              const SizedBox(
                width: 24,
              ),
              AppBarButton(
                text: 'Pacotes',
                onTap: () {
                  if (currentPage != PagesEnum.home) {
                    context.go('/');
                    Future.delayed(
                      const Duration(milliseconds: 500),
                    ).then((value) {
                      Scrollable.ensureVisible(
                        CustomScrollKeys.packagesKey.currentContext!,
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
                      );
                    });
                  } else {
                    Scrollable.ensureVisible(
                      CustomScrollKeys.packagesKey.currentContext!,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
                    );
                  }
                },
              ),
              const SizedBox(
                width: 24,
              ),
              AppBarButton(
                text: 'Aluguel de Carros',
                onTap: () {
                  if (currentPage != PagesEnum.carRent) {
                    context.go('/aluguel-carros');
                  }
                },
                isSelected: currentPage == PagesEnum.carRent,
              ),
              const SizedBox(
                width: 24,
              ),
              AppBarButton(
                text: 'Sobre Nós',
                onTap: () {
                  if (currentPage != PagesEnum.about) {
                    context.go('/sobre');
                  }
                },
                isSelected: currentPage == PagesEnum.about,
              ),
              const SizedBox(
                width: 24,
              ),
              AppBarButton(
                text: 'Blog',
                onTap: () {
                  if (currentPage != PagesEnum.blog) {
                    context.go('/blog');
                  }
                },
                isSelected: currentPage == PagesEnum.blog,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

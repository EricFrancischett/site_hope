import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/custom_app_bar/app_bar_button.dart';

class CustomAppBar extends StatefulWidget {
  final GlobalKey ticketsKey;
  final GlobalKey hotelsKey;
  final GlobalKey packagesKey;
  const CustomAppBar({
    super.key,
    required this.ticketsKey,
    required this.hotelsKey,
    required this.packagesKey,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
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
              Container(
                width: 28,
                height: 33,
                color: AppColors.hopeWhite,
              ),
              const SizedBox(
                width: 24,
              ),
              AppBarButton(
                text: 'Passagens Aéreas',
                onTap: () {
                  Scrollable.ensureVisible(
                    widget.ticketsKey.currentContext!,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
                  );
                },
              ),
              const SizedBox(
                width: 24,
              ),
              AppBarButton(
                text: 'Hotéis',
                onTap: () {
                  Scrollable.ensureVisible(
                    widget.hotelsKey.currentContext!,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
                  );
                },
              ),
              const SizedBox(
                width: 24,
              ),
              AppBarButton(
                text: 'Pacotes',
                onTap: () {
                  Scrollable.ensureVisible(
                    widget.packagesKey.currentContext!,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
                  );
                },
              ),
            ],
          ),
          Row(
            children: [
              AppBarButton(
                text: 'Sobre Nós',
                onTap: () {
                  context.go('/about');
                },
              ),
              const SizedBox(
                width: 24,
              ),
              AppBarButton(
                text: 'Blog',
                onTap: () {
                  context.go('/blog');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

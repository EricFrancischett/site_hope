import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/custom_app_bar/app_bar_button.dart';
import 'package:site_hope/general/custom_app_bar/pages_enum.dart';
import 'package:site_hope/general/custom_scroll_keys.dart';
import 'package:site_hope/general/image_constants.dart';

class CustomAppBarMobile extends StatefulWidget {
  final PagesEnum currentPage;
  const CustomAppBarMobile({
    super.key,
    required this.currentPage,
  });

  @override
  State<CustomAppBarMobile> createState() => _CustomAppBarMobileState();
}

class _CustomAppBarMobileState extends State<CustomAppBarMobile> {
  final ExpansionTileController _controller = ExpansionTileController();
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: ExpansionTile(
        controller: _controller,
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        tilePadding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        initiallyExpanded: false,
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
        expandedAlignment: Alignment.centerRight,
        expandedCrossAxisAlignment: CrossAxisAlignment.end,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          side: BorderSide(
            color: AppColors.hopeOrange,
            width: 1,
          ),
        ),
        collapsedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        collapsedBackgroundColor: AppColors.hopeOrange,
        title: Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              if (widget.currentPage != PagesEnum.home) {
                context.go('/');
              }
            },
            child: SvgPicture.asset(
              !isExpanded
                  ? ImageConstants.hopeSimbolo
                  : ImageConstants.hopeSimboloLaranja,
            ),
          ),
        ),
        trailing: Icon(
          Icons.dehaze_rounded,
          color: isExpanded ? AppColors.hopeOrange : AppColors.hopeWhite,
          size: 29,
        ),
        children: [
          // AppBarButton(
          //   text: 'Passagens Aéreas',
          //   fontColor: AppColors.hopeDarkGrey,
          //   hoverColor: AppColors.hopeOrange,
          //   selectedColor: AppColors.hopeOrange,
          //   onTap: () async {
          //     _controller.collapse();
          //     if (widget.currentPage != PagesEnum.home) {
          //       context.go('/');
          //       Future.delayed(
          //         const Duration(milliseconds: 500),
          //       ).then((value) {
          //         Scrollable.ensureVisible(
          //           CustomScrollKeys.ticketsKey.currentContext!,
          //           duration: const Duration(
          //             milliseconds: 500,
          //           ),
          //           alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
          //         );
          //       });
          //     } else {
          //       Scrollable.ensureVisible(
          //         CustomScrollKeys.ticketsKey.currentContext!,
          //         duration: const Duration(
          //           milliseconds: 500,
          //         ),
          //         alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
          //       );
          //     }
          //   },
          // ),
          AppBarButton(
            text: 'Hotéis',
            fontColor: AppColors.hopeDarkGrey,
            hoverColor: AppColors.hopeOrange,
            selectedColor: AppColors.hopeOrange,
            onTap: () {
              _controller.collapse();
              if (widget.currentPage != PagesEnum.home) {
                context.go('/');
                Future.delayed(
                  const Duration(milliseconds: 500),
                ).then((value) {
                  Scrollable.ensureVisible(
                    CustomScrollKeys.hotelsKey.currentContext!,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    alignment: -2.5,
                    alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
                  );
                });
              } else {
                Scrollable.ensureVisible(
                  CustomScrollKeys.hotelsKey.currentContext!,
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  alignment: -2.5,
                  alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
                );
              }
            },
          ),
          const SizedBox(
            height: 24,
          ),
          AppBarButton(
            text: 'Pacotes',
            fontColor: AppColors.hopeDarkGrey,
            hoverColor: AppColors.hopeOrange,
            selectedColor: AppColors.hopeOrange,
            onTap: () {
              _controller.collapse();
              if (widget.currentPage != PagesEnum.home) {
                context.go('/');
                Future.delayed(
                  const Duration(milliseconds: 500),
                ).then((value) {
                  Scrollable.ensureVisible(
                    CustomScrollKeys.packagesKey.currentContext!,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    alignment: 1.75,
                    alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
                  );
                });
              } else {
                Scrollable.ensureVisible(
                  CustomScrollKeys.packagesKey.currentContext!,
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  alignment: 1.75,
                  alignmentPolicy: ScrollPositionAlignmentPolicy.explicit,
                );
              }
            },
          ),
          const SizedBox(
            height: 24,
          ),
          AppBarButton(
            text: 'Aluguel de Carros',
            fontColor: AppColors.hopeDarkGrey,
            hoverColor: AppColors.hopeOrange,
            selectedColor: AppColors.hopeOrange,
            isSelected: widget.currentPage == PagesEnum.carRent,
            onTap: () {
              if (widget.currentPage != PagesEnum.carRent) {
                context.go('/aluguel-carros');
              }
            },
          ),
          const SizedBox(
            height: 24,
          ),
          AppBarButton(
            text: 'Sobre Nós',
            fontColor: AppColors.hopeDarkGrey,
            hoverColor: AppColors.hopeOrange,
            selectedColor: AppColors.hopeOrange,
            isSelected: widget.currentPage == PagesEnum.about,
            onTap: () {
              if (widget.currentPage != PagesEnum.about) {
                context.go('/sobre');
              }
            },
          ),
          const SizedBox(
            height: 24,
          ),
          AppBarButton(
            text: 'Blog',
            fontColor: AppColors.hopeDarkGrey,
            hoverColor: AppColors.hopeOrange,
            selectedColor: AppColors.hopeOrange,
            isSelected: widget.currentPage == PagesEnum.blog,
            onTap: () {
              if (widget.currentPage != PagesEnum.blog) {
                context.go('/blog');
              }
            },
          ),
        ],
      ),
    );
  }
}

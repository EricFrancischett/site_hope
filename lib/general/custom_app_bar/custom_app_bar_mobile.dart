import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/custom_app_bar/app_bar_button.dart';

class CustomAppBarMobile extends StatefulWidget {
  const CustomAppBarMobile({super.key});

  @override
  State<CustomAppBarMobile> createState() => _CustomAppBarMobileState();
}

class _CustomAppBarMobileState extends State<CustomAppBarMobile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
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
        child: Container(
          width: 28,
          height: 33,
          color: isExpanded ? AppColors.hopeOrange : AppColors.hopeWhite,
        ),
      ),
      trailing: Icon(
        Icons.dehaze_rounded,
        color: isExpanded ? AppColors.hopeOrange : AppColors.hopeWhite,
        size: 29,
      ),
      children: const [
        AppBarButton(
          text: 'Passagens Aéreas',
          fontColor: AppColors.hopeDarkGrey,
          hoverColor: AppColors.hopeOrange,
          selectedColor: AppColors.hopeOrange,
        ),
        SizedBox(
          height: 24,
        ),
        AppBarButton(
          text: 'Hotéis',
          fontColor: AppColors.hopeDarkGrey,
          hoverColor: AppColors.hopeOrange,
          selectedColor: AppColors.hopeOrange,
        ),
        SizedBox(
          height: 24,
        ),
        AppBarButton(
          text: 'Pacotes',
          fontColor: AppColors.hopeDarkGrey,
          hoverColor: AppColors.hopeOrange,
          selectedColor: AppColors.hopeOrange,
        ),
        SizedBox(
          height: 24,
        ),
        AppBarButton(
          text: 'Aluguel de Carro',
          fontColor: AppColors.hopeDarkGrey,
          hoverColor: AppColors.hopeOrange,
          selectedColor: AppColors.hopeOrange,
          isSelected: true,
        ),
        SizedBox(
          height: 24,
        ),
        AppBarButton(
          text: 'Sobre Nós',
          fontColor: AppColors.hopeDarkGrey,
          hoverColor: AppColors.hopeOrange,
          selectedColor: AppColors.hopeOrange,
        ),
        SizedBox(
          height: 24,
        ),
        AppBarButton(
          text: 'Blog',
          fontColor: AppColors.hopeDarkGrey,
          hoverColor: AppColors.hopeOrange,
          selectedColor: AppColors.hopeOrange,
        ),
      ],
    );
  }
}

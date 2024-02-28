import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/custom_app_bar/app_bar_button.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

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
              const AppBarButton(
                text: 'Passagens Aéreas',
              ),
              const SizedBox(
                width: 24,
              ),
              const AppBarButton(
                text: 'Hotéis',
                isSelected: true,
              ),
              const SizedBox(
                width: 24,
              ),
              const AppBarButton(
                text: 'Pacotes',
              ),
              const SizedBox(
                width: 24,
              ),
              const AppBarButton(
                text: 'Aluguel de Carro',
              ),
              const SizedBox(
                width: 24,
              ),
              const AppBarButton(
                text: 'Passeios',
              ),
            ],
          ),
          const Row(
            children: [
              AppBarButton(
                text: 'Sobre Nós',
              ),
              SizedBox(
                width: 24,
              ),
              AppBarButton(
                text: 'Blog',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/widgets/app_custom_button.dart';

class CustomTripCard extends StatelessWidget {
  const CustomTripCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 260,
          decoration: const BoxDecoration(
            color: AppColors.hopeGrey,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -16),
          child: Center(
            child: SizedBox(
              width: 260,
              child: AppCustomButton(
                onTap: () {},
                title: 'Personalize sua viagem aqui!',
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

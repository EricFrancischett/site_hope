import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/widgets/hotels_card.dart';

class HotelsGridWidget extends StatelessWidget {
  const HotelsGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text.rich(
          TextSpan(
            text: 'Hotéis',
            children: [
              TextSpan(
                text: ' mais ',
                style: TextStyle(
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
              TextSpan(
                text: 'procurados',
              ),
              TextSpan(
                text: ' na HOPE',
                style: TextStyle(
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ],
          ),
          style: TextStyle(
            height: 1.2,
            fontWeight: FontWeightHelper.extraBold,
            fontSize: 24,
            color: AppColors.hopeBlack,
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          children: List.generate(
            8,
            (index) => const HotelsCard(
              name: 'Grand Carimã Resort & Convention Center',
              imageUrl: null,
            ),
          ),
        )
      ],
    );
  }
}

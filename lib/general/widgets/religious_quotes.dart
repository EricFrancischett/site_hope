import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';

class ReligiousQuotes extends StatelessWidget {
  final String title;
  final String subtitle;
  const ReligiousQuotes({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: SizedBox(
            width: 534,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeightHelper.semiBold,
                fontSize: 14,
                color: AppColors.hopeOrange,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontWeight: FontWeightHelper.light,
            fontSize: 12,
            color: AppColors.hopeOrange,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

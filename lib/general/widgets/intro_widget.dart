import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/widgets/custom_trip_card.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Center(
          child: SizedBox(
            width: 534,
            child: Text(
              '“May the God of HOPE fill you with all joy and peace as you trust in him, so that you may overflow with HOPE by the power of the Holy Spirit.”',
              style: TextStyle(
                fontWeight: FontWeightHelper.semiBold,
                fontSize: 14,
                color: AppColors.hopeOrange,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Text(
          'Rm 15:13',
          style: TextStyle(
            fontWeight: FontWeightHelper.light,
            fontSize: 12,
            color: AppColors.hopeOrange,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 40,
        ),
        CustomTripCard(),
        SizedBox(
          height: 60,
        ),
        Center(
          child: Text.rich(
            TextSpan(
              text: 'Viajar é mais do que visitar\nlugares, é ',
              children: [
                TextSpan(
                  text: 'criar memórias.',
                  style: TextStyle(
                    fontWeight: FontWeightHelper.black,
                  ),
                ),
              ],
            ),
            style: TextStyle(
              height: 1.2,
              fontWeight: FontWeightHelper.semiBold,
              fontSize: 14,
              color: AppColors.hopeBlack,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
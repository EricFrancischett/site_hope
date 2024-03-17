import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/widgets/custom_trip_card.dart';
import 'package:site_hope/general/widgets/religious_quotes.dart';

class IntroWidget extends StatelessWidget {
  final String imageUrl;
  const IntroWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(
          height: 40,
        ),
        const ReligiousQuotes(
          title:
              '“May the God of HOPE fill you with all joy and peace as you trust in him, so that you may overflow with HOPE by the power of the Holy Spirit.”',
          subtitle: 'Rm 15:13',
        ),
        const SizedBox(
          height: 40,
        ),
        CustomTripCard(
          imageUrl: imageUrl,
        ),
        const SizedBox(
          height: 60,
        ),
        const Center(
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

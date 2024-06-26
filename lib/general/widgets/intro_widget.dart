import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/widgets/custom_trip_card.dart';
import 'package:site_hope/general/widgets/religious_quotes.dart';

class IntroWidget extends StatelessWidget {
  final String imageUrl;
  final String religiousString;
  final String religiousSubtitle;
  const IntroWidget({
    super.key,
    required this.imageUrl,
    this.religiousString = '“May the God of HOPE fill you with all joy and peace as you trust in him, so that you may overflow with HOPE by the power of the Holy Spirit.”',
    this.religiousSubtitle = 'Rm 15:13',
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
        ReligiousQuotes(
          title:
              religiousString,
          subtitle: religiousSubtitle,
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

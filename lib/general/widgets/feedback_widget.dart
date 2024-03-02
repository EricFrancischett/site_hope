import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/widgets/feedback_card_widget.dart';

class FeedbackWidget extends StatelessWidget {
  final CurrentResolution resolution;
  const FeedbackWidget({
    super.key,
    required this.resolution,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.only(
              left: resolution == CurrentResolution.isWeb ? 40 : 30,
            ),
            child: const Text.rich(
              TextSpan(
                text: 'Ouça ',
                children: [
                  TextSpan(
                    text: 'quem já viajou',
                    style: TextStyle(
                      fontWeight: FontWeightHelper.extraBold,
                    ),
                  ),
                  TextSpan(
                    text: ' com a ',
                  ),
                  TextSpan(
                    text: 'HOPE',
                    style: TextStyle(
                      fontWeight: FontWeightHelper.extraBold,
                    ),
                  ),
                ],
              ),
              style: TextStyle(
                height: 1.2,
                fontSize: 24,
                fontWeight: FontWeightHelper.semiBold,
                color: AppColors.hopeBlack,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        CarouselSlider(
          disableGesture: true,
          items: const [
            FeedbackCardWidget(),
          ],
          options: CarouselOptions(
            pageSnapping: false,
            autoPlay: true,
            height: 180,
            viewportFraction: 1,
            scrollPhysics: const NeverScrollableScrollPhysics(),
          ),
        ),
      ],
    );
  }
}

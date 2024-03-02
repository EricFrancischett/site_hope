import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/widgets/priced_card_widget.dart';

class TicketsWidget extends StatelessWidget {
  const TicketsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text.rich(
            TextSpan(
              text: 'Passagens Aéreas',
              children: [
                TextSpan(
                  text: ' para você aproveitar hoje',
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
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  PricedCardWidget(),
                  SizedBox(
                    width: 24,
                  ),
                  PricedCardWidget(),
                  SizedBox(
                    width: 24,
                  ),
                  PricedCardWidget(),
                  SizedBox(
                    width: 24,
                  ),
                  PricedCardWidget(),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

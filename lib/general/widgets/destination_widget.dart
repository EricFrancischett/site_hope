import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/widgets/destinations_card_widget.dart';

class DestinationWidget extends StatelessWidget {
  const DestinationWidget({super.key});

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
              text: 'Destinos ',
              children: [
                TextSpan(
                  text: 'mais procurados',
                  style: TextStyle(
                    fontWeight: FontWeightHelper.extraBold,
                  ),
                ),
                TextSpan(
                  text: ' na HOPE',
                ),
              ],
            ),
            style: TextStyle(
              height: 1.2,
              fontWeight: FontWeightHelper.semiBold,
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
                  DestinationCardWidget(),
                  SizedBox(
                    width: 24,
                  ),
                  DestinationCardWidget(),
                  SizedBox(
                    width: 24,
                  ),
                  DestinationCardWidget(),
                  SizedBox(
                    width: 24,
                  ),
                  DestinationCardWidget(),
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

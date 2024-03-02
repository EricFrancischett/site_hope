import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/widgets/highlight_packs_card_widget.dart';

class HighlightPacksWidget extends StatelessWidget {
  const HighlightPacksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.hopeGrey,
          width: 1,
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 40, bottom: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                'Pacotes em Destaque',
                style: TextStyle(
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
                        width: 40,
                      ),
                      HighlightPacksCardWidget(),
                      SizedBox(
                        width: 24,
                      ),
                      HighlightPacksCardWidget(),
                      SizedBox(
                        width: 24,
                      ),
                      HighlightPacksCardWidget(),
                      SizedBox(
                        width: 24,
                      ),
                      HighlightPacksCardWidget(),
                      SizedBox(
                        width: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

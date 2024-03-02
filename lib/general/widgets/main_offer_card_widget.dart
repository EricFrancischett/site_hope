import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/widgets/app_custom_button.dart';

class MainOfferCardWidget extends StatelessWidget {
  const MainOfferCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.hopeGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      height: 260,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Stack(
          alignment: Alignment.bottomLeft,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 302,
              height: 216,
              decoration: BoxDecoration(
                color: AppColors.hopeWhite,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'OFERTA\nRELÂMPAGO',
                    style: TextStyle(
                      fontWeight: FontWeightHelper.extraBold,
                      fontSize: 32,
                      color: AppColors.hopeBlack,
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Voo',
                      children: [
                        TextSpan(
                          text: ' para ',
                          style: TextStyle(
                            fontWeight: FontWeightHelper.medium,
                          ),
                        ),
                        TextSpan(
                          text: 'Madri',
                        ),
                        TextSpan(
                          text: ' por',
                          style: TextStyle(
                            fontWeight: FontWeightHelper.medium,
                          ),
                        ),
                      ],
                    ),
                    style: TextStyle(
                      fontWeight: FontWeightHelper.bold,
                      fontSize: 16,
                      color: AppColors.hopeDarkGrey,
                    ),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Text(
                    'à vista',
                    style: TextStyle(
                      height: 0.5,
                      fontWeight: FontWeightHelper.regular,
                      fontSize: 16,
                      color: AppColors.hopeOrange,
                    ),
                  ),
                  Text(
                    'R\$2.999,90',
                    style: TextStyle(
                      fontWeight: FontWeightHelper.extraBold,
                      fontSize: 32,
                      color: AppColors.hopeOrange,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: -16,
              left: 26,
              child: SizedBox(
                width: 103,
                child: AppCustomButton(
                  onTap: () {},
                  title: 'EU QUERO',
                  isOrange: false,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

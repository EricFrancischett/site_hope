import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/widgets/app_custom_button.dart';

class PricedCardWidget extends StatelessWidget {
  const PricedCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 332,
      width: 196,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            children: [
              Container(
                height: 168,
                width: 196,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 9,
                ),
                decoration: const BoxDecoration(
                  color: AppColors.hopeGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 53,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.hopeYellow,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'AÉREO',
                        style: TextStyle(
                          fontWeight: FontWeightHelper.semiBold,
                          fontSize: 10,
                          color: AppColors.hopeBlack,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 132,
                width: 196,
                decoration: const BoxDecoration(
                  color: AppColors.hopeWhite,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  border: Border(
                    left: BorderSide(
                      color: AppColors.hopeGrey,
                      width: 1,
                    ),
                    right: BorderSide(
                      color: AppColors.hopeGrey,
                      width: 1,
                    ),
                    bottom: BorderSide(
                      color: AppColors.hopeGrey,
                      width: 1,
                    ),
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'PORTO SEGURO',
                      style: TextStyle(
                        fontWeight: FontWeightHelper.semiBold,
                        fontSize: 14,
                        color: AppColors.hopeBlack,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Saída de São Paulo',
                      style: TextStyle(
                        fontWeight: FontWeightHelper.medium,
                        fontSize: 12,
                        color: AppColors.hopeDarkGrey,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      'a partir de',
                      style: TextStyle(
                        fontWeight: FontWeightHelper.regular,
                        fontSize: 12,
                        color: AppColors.hopeDarkGrey,
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      'R\$328',
                      style: TextStyle(
                        fontWeight: FontWeightHelper.extraBold,
                        fontSize: 18,
                        color: AppColors.hopeOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: const Offset(0, -16),
            child: Center(
              child: SizedBox(
                width: 79,
                child: AppCustomButton(
                  onTap: () {},
                  title: 'QUERO',
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

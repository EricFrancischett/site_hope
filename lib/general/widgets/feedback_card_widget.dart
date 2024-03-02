import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';

class FeedbackCardWidget extends StatelessWidget {
  const FeedbackCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 410,
      decoration: BoxDecoration(
        color: AppColors.hopeWhite,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 1,
          color: AppColors.hopeGrey,
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 22,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.hopeGrey,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flávia de Souza',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.hopeBlack,
                      fontWeight: FontWeightHelper.semiBold,
                      height: 1,
                    ),
                  ),
                  Text(
                    'Curitiba - PR',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.hopeBlack,
                      fontWeight: FontWeightHelper.regular,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Amamos a viagem! A Hope foi muito atenciosa, conseguimos aproveitar muito, se eles não tivessem montado a viagem com todos os passeios não ia ser tão incrível, obrigada!',
            style: TextStyle(
              fontSize: 14,
              color: AppColors.hopeBlack,
              fontWeight: FontWeightHelper.regular,
              height: 1
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/widgets/app_custom_button.dart';

class HighlightPacksCardWidget extends StatelessWidget {
  final String title;
  final String type;
  final String quantity;
  final String period;
  final String imageUrl;
  const HighlightPacksCardWidget({
    super.key,
    required this.title,
    required this.type,
    required this.quantity,
    required this.period,
    required this.imageUrl,
  });

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
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(imageUrl)),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 59,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.hopeOrange,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'PACOTE',
                        style: TextStyle(
                          fontWeight: FontWeightHelper.semiBold,
                          fontSize: 10,
                          color: AppColors.hopeWhite,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeightHelper.semiBold,
                        fontSize: 14,
                        color: AppColors.hopeBlack,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      type,
                      style: const TextStyle(
                        fontWeight: FontWeightHelper.bold,
                        fontSize: 12,
                        color: AppColors.hopeBlack,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      quantity,
                      style: const TextStyle(
                        fontWeight: FontWeightHelper.medium,
                        fontSize: 12,
                        color: AppColors.hopeBlack,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      period,
                      style: const TextStyle(
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

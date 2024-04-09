import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';

class HotelsCard extends StatelessWidget {
  final String name;
  final String? imageUrl;
  const HotelsCard({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
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
                  color: imageUrl == null ? AppColors.hopeGrey : null,
                  image: imageUrl == null
                      ? null
                      : DecorationImage(image: NetworkImage(imageUrl!)),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                height: 81,
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
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeightHelper.bold,
                        fontSize: 14,
                        color: AppColors.hopeBlack,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

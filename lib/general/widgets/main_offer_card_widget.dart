import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/widgets/app_custom_button.dart';

class MainOfferCardWidget extends StatelessWidget {
  final CurrentResolution resolution;
  final String title;
  final String description;
  final String price;
  final String paymentType;
  final String imageUrl;

  const MainOfferCardWidget({
    super.key,
    required this.resolution,
    required this.title,
    required this.description,
    required this.price,
    required this.paymentType,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return resolution != CurrentResolution.isCellPhone
        ? _buildWebVersion()
        : _buildMobileVersion();
  }

  Widget _buildWebVersion() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.fitHeight,
        ),
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
              height: 218,
              decoration: BoxDecoration(
                color: AppColors.hopeWhite,
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeightHelper.extraBold,
                      fontSize: 32,
                      color: AppColors.hopeBlack,
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontWeight: FontWeightHelper.bold,
                      fontSize: 16,
                      color: AppColors.hopeDarkGrey,
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Text(
                    paymentType,
                    style: const TextStyle(
                      height: 0.5,
                      fontWeight: FontWeightHelper.regular,
                      fontSize: 16,
                      color: AppColors.hopeOrange,
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
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

  Widget _buildMobileVersion() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            imageUrl,
          ),
          fit: BoxFit.fitHeight,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      height: 260,
      padding: const EdgeInsets.all(26),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 160,
              height: 134,
              decoration: BoxDecoration(
                color: AppColors.hopeWhite,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeightHelper.extraBold,
                      fontSize: 18,
                      color: AppColors.hopeBlack,
                      height: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      fontWeight: FontWeightHelper.bold,
                      fontSize: 10,
                      color: AppColors.hopeDarkGrey,
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    paymentType,
                    style: const TextStyle(
                      height: 0.5,
                      fontWeight: FontWeightHelper.regular,
                      fontSize: 10,
                      color: AppColors.hopeOrange,
                    ),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontWeight: FontWeightHelper.extraBold,
                      fontSize: 20,
                      color: AppColors.hopeOrange,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: -16,
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

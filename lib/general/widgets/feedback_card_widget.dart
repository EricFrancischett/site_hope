import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/feedback_entity.dart';
import 'package:site_hope/general/font_weight_helper.dart';

class FeedbackCardWidget extends StatelessWidget {
  final FeedBackEntity feedback;
  const FeedbackCardWidget({
    super.key,
    required this.feedback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      height: 300,
      decoration: BoxDecoration(
        color: AppColors.hopeWhite,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 1,
          color: AppColors.hopeGrey,
        ),
      ),
      padding: const EdgeInsets.only(
        top: 17,
        bottom: 30,
        left: 30,
        right: 30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            feedback.name,
            style: const TextStyle(
                fontSize: 18,
                color: AppColors.hopeBlack,
                fontWeight: FontWeightHelper.semiBold,
                height: 1),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            feedback.locale,
            style: const TextStyle(
                fontSize: 12,
                color: AppColors.hopeBlack,
                fontWeight: FontWeightHelper.semiBold,
                height: 1),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  feedback.thumbUrl,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ],
      ),
    );
  }
}

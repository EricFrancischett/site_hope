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
      width: 298,
      height: 260,
      decoration: BoxDecoration(
        color: AppColors.hopeWhite,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 1,
          color: AppColors.hopeGrey,
        ),
      ),
      padding: const EdgeInsets.all(
        30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            feedback.name,
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.hopeBlack,
              fontWeight: FontWeightHelper.semiBold,
              height: 1,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            color: AppColors.hopeOrange,
          ),
        ],
      ),
    );
  }
}

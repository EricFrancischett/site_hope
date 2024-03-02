import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/widgets/app_custom_button.dart';
import 'package:site_hope/general/widgets/custom_holtels_grid.dart';

class HotelsWidget extends StatelessWidget {
  final CurrentResolution resolution;
  const HotelsWidget({
    super.key,
    required this.resolution,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text.rich(
          TextSpan(
            text: 'Hotéis',
            children: [
              TextSpan(
                text: ' mais ',
                style: TextStyle(
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
              TextSpan(
                text: 'procurados',
              ),
              TextSpan(
                text: ' na HOPE',
                style: TextStyle(
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
            ],
          ),
          style: TextStyle(
            height: 1.2,
            fontWeight: FontWeightHelper.extraBold,
            fontSize: 24,
            color: AppColors.hopeBlack,
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        resolution == CurrentResolution.isCellPhone
            ? _buildMobile()
            : _buildWeb(),
        const SizedBox(
          height: 35,
        ),
        Center(
          child: SizedBox(
            width: 173,
            child: AppCustomButton(
              title: 'Quero saber mais!',
              onTap: () {},
              fontWeight: FontWeightHelper.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWeb() {
    return SizedBox(
      height: 300,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return CustomHotelsGrid(
            constraints: constraints,
            currentResolution: resolution,
          );
        },
      ),
    );
  }

  Widget _buildMobile() {
    return SizedBox(
      height: 624,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.hopeGrey,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.hopeGrey,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.hopeGrey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.hopeGrey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

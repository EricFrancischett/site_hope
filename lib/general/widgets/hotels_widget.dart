import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/db_entity.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/widgets/app_custom_button.dart';

class HotelsWidget extends StatelessWidget {
  final CurrentResolution resolution;
  final List<HotelEntity> hotels;
  const HotelsWidget({
    super.key,
    required this.resolution,
    required this.hotels,
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
      // child: LayoutBuilder(
      //   builder: (context, constraints) {
      //     return CustomHotelsGrid(
      //       constraints: constraints,
      //       currentResolution: resolution,
      //     );
      //   },
      // ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    hotels[0].imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    hotels[0].name,
                    style: TextStyle(
                      color: AppColors.hopeWhite,
                      fontSize: 32,
                      fontWeight: FontWeightHelper.medium,
                      shadows: <Shadow>[
                        Shadow(
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 3.0,
                          color: AppColors.hopeBlack.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          hotels[1].imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          hotels[1].name,
                          style: TextStyle(
                            color: AppColors.hopeWhite,
                            fontSize: 24,
                            fontWeight: FontWeightHelper.medium,
                            shadows: <Shadow>[
                              Shadow(
                                offset: const Offset(3.0, 3.0),
                                blurRadius: 3.0,
                                color: AppColors.hopeBlack.withOpacity(0.3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                hotels[2].imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6,
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                hotels[2].name,
                                style: TextStyle(
                                  color: AppColors.hopeWhite,
                                  fontSize: 18,
                                  fontWeight: FontWeightHelper.medium,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: const Offset(3.0, 3.0),
                                      blurRadius: 3.0,
                                      color:
                                          AppColors.hopeBlack.withOpacity(0.3),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                hotels[3].imageUrl,
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6,
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                hotels[3].name,
                                style: TextStyle(
                                  color: AppColors.hopeWhite,
                                  fontSize: 18,
                                  fontWeight: FontWeightHelper.medium,
                                  shadows: <Shadow>[
                                    Shadow(
                                      offset: const Offset(3.0, 3.0),
                                      blurRadius: 3.0,
                                      color:
                                          AppColors.hopeBlack.withOpacity(0.3),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMobile() {
    return SizedBox(
      height: 580,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    hotels[0].imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    hotels[0].name,
                    style: TextStyle(
                      color: AppColors.hopeWhite,
                      fontSize: 32,
                      fontWeight: FontWeightHelper.medium,
                      shadows: <Shadow>[
                        Shadow(
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 3.0,
                          color: AppColors.hopeBlack.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    hotels[1].imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    hotels[1].name,
                    style: TextStyle(
                      color: AppColors.hopeWhite,
                      fontSize: 32,
                      fontWeight: FontWeightHelper.medium,
                      shadows: <Shadow>[
                        Shadow(
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 3.0,
                          color: AppColors.hopeBlack.withOpacity(0.3),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          hotels[2].imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          hotels[2].name,
                          style: TextStyle(
                            color: AppColors.hopeWhite,
                            fontSize: 18,
                            fontWeight: FontWeightHelper.medium,
                            shadows: <Shadow>[
                              Shadow(
                                offset: const Offset(3.0, 3.0),
                                blurRadius: 3.0,
                                color: AppColors.hopeBlack.withOpacity(0.3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          hotels[3].imageUrl,
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 12,
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          hotels[3].name,
                          style: TextStyle(
                            color: AppColors.hopeWhite,
                            fontSize: 18,
                            fontWeight: FontWeightHelper.medium,
                            shadows: <Shadow>[
                              Shadow(
                                offset: const Offset(3.0, 3.0),
                                blurRadius: 3.0,
                                color: AppColors.hopeBlack.withOpacity(0.3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

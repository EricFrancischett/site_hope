import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/db_home_entity.dart';
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
        const Center(
          child: SizedBox(
            width: 173,
            child: AppCustomButton(
              title: 'Quero saber mais!',
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
      child: Row(
        children: [
          Expanded(
            child: _buildCard(hotel: hotels[0]),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: _buildCard(hotel: hotels[1])),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(child: _buildCard(hotel: hotels[2])),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(child: _buildCard(hotel: hotels[3])),
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
            child: _buildCard(hotel: hotels[0]),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: _buildCard(hotel: hotels[1]),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: _buildCard(hotel: hotels[2])),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: _buildCard(hotel: hotels[3]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard({required HotelEntity hotel}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            hotel.imageUrl,
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          16,
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.hopeWhite,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 4,
            ),
            child: Text(
              hotel.name,
              style: const TextStyle(
                color: AppColors.hopeOrange,
                fontSize: 14,
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

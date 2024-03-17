import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/db_entity.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/widgets/destinations_card_widget.dart';

class DestinationWidget extends StatelessWidget {
  final List<DestinationEntity> destinations;
  const DestinationWidget({
    Key? key,
    required this.destinations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text.rich(
            TextSpan(
              text: 'Destinos ',
              children: [
                TextSpan(
                  text: 'mais procurados',
                  style: TextStyle(
                    fontWeight: FontWeightHelper.extraBold,
                  ),
                ),
                TextSpan(
                  text: ' na HOPE',
                ),
              ],
            ),
            style: TextStyle(
              height: 1.2,
              fontWeight: FontWeightHelper.semiBold,
              fontSize: 24,
              color: AppColors.hopeBlack,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  ...destinations.map(
                    (destination) {
                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          DestinationCardWidget(
                            title: destination.title,
                            imageUrl: destination.imageUrl,
                            index: destinations.indexOf(destination),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                        ],
                      );
                    },
                  ).toList(),
                  const SizedBox(
                    width: 6,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/db_home_entity.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/widgets/highlight_packs_card_widget.dart';

class HighlightPacksWidget extends StatelessWidget {
  final List<PackEntity> packs;
  const HighlightPacksWidget({
    super.key,
    required this.packs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: AppColors.hopeGrey,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 40),
              child: Text(
                'Pacotes em Destaque',
                style: TextStyle(
                  fontWeight: FontWeightHelper.extraBold,
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
                        width: 40,
                      ),
                      ...packs.map(
                        (pack) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              HighlightPacksCardWidget(
                                title: pack.title,
                                type: pack.type,
                                quantity: pack.quantity,
                                period: pack.period,
                                imageUrl: pack.imageUrl,
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                            ],
                          );
                        },
                      ).toList(),
                      const SizedBox(
                        width: 16,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

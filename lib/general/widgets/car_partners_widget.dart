import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';

class CarPartnersWidget extends StatelessWidget {
  final List<String> partnersLogoUrl;
  const CarPartnersWidget({
    super.key,
    required this.partnersLogoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                'Conheça nossos parceiros',
                style: TextStyle(
                  fontWeight: FontWeightHelper.extraBold,
                  fontSize: 24,
                  color: AppColors.hopeBlack,
                ),
              ),
            ),
            SizedBox(
              height: 248,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: partnersLogoUrl.length,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 23,
                ),
                padding: const EdgeInsets.all(40),
                itemBuilder: (context, index) {
                  return Container(
                    width: 196,
                    height: 168,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          partnersLogoUrl[index],
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

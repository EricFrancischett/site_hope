import 'package:flutter/material.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/widgets/app_custom_button.dart';

class CustomTripCard extends StatelessWidget {
  final String imageUrl;
  const CustomTripCard({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 260,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                imageUrl,
              ),
              fit: BoxFit.fitHeight,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -16),
          child: Center(
            child: SizedBox(
              width: 260,
              child: AppCustomButton(
                onTap: () {},
                title: 'Personalize sua viagem aqui!',
                fontWeight: FontWeightHelper.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

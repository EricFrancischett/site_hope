import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/widgets/feedback_widget.dart';

class AppFooter extends StatelessWidget {
  final CurrentResolution resolution;
  const AppFooter({
    super.key,
    required this.resolution,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FeedbackWidget(
          resolution: resolution,
        ),
        const SizedBox(
          height: 50,
        ),
        Container(
          color: AppColors.hopeGrey,
          child: resolution == CurrentResolution.isWeb
              ? _buildWeb()
              : _buildMobile(),
        ),
      ],
    );
  }

  Widget brandInfo() {
    return const Text(
      'Cosendei & Paixao Ltda\nCNPJ 48.293.637/0001-40\nCadastur: 48.293.637/0001-40',
      style: TextStyle(
        fontSize: 14,
        color: AppColors.hopeBlack,
        fontWeight: FontWeightHelper.regular,
        height: 1.2,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget contatoInfo() {
    return const Text.rich(
      TextSpan(
        text: 'Atendimento, Reservas e Suporte\n',
        children: [
          TextSpan(
            text: '(41) 99641-2016',
            style: TextStyle(
              fontWeight: FontWeightHelper.bold,
            ),
          ),
          TextSpan(
            text:
                '\nSegunda a Sexta: das 09h às 21h\nSábado: das 09h às 16h\nhopeviagens@gmail.com',
          ),
        ],
      ),
      style: TextStyle(
        fontSize: 14,
        color: AppColors.hopeBlack,
        fontWeight: FontWeightHelper.regular,
        height: 1.2,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget socialMediaInfo() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Siga nossas redes sociais\ne fique por dentro.',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.hopeOrange,
            fontWeight: FontWeightHelper.extraBold,
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.instagram,
              color: AppColors.hopeOrange,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.facebook,
              color: AppColors.hopeOrange,
              size: 25,
            ),
          ],
        )
      ],
    );
  }

  _buildWeb() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 80,
        vertical: 40,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          brandInfo(),
          contatoInfo(),
          socialMediaInfo(),
        ],
      ),
    );
  }

  _buildMobile() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 40,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          brandInfo(),
          const SizedBox(
            height: 40,
          ),
          contatoInfo(),
          const SizedBox(
            height: 40,
          ),
          socialMediaInfo(),
        ],
      ),
    );
  }
}

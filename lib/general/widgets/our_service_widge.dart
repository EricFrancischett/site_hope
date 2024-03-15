import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/widgets/feedback_widget.dart';

class OurService extends StatelessWidget {
  final CurrentResolution resolution;
  const OurService({
    super.key,
    required this.resolution,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Nosso atendimento é 100% online',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeightHelper.semiBold,
            color: AppColors.hopeOrange,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        _buildNumberContainer(
          number: '01. ',
          text: 'Você entra em contato conosco via WhatsApp.',
        ),
        const SizedBox(
          height: 6,
        ),
        _buildNumberContainer(
          number: '02. ',
          text: 'Conta um pouco sobre a sua viagem dos sonhos.',
        ),
        const SizedBox(
          height: 6,
        ),
        _buildNumberContainer(
          number: '03. ',
          text: 'Recebe opções personalizadas que iremos te enviar.',
        ),
        const SizedBox(
          height: 6,
        ),
        _buildNumberContainer(
          number: '04. ',
          text: 'Se prepara para a sua viagem!',
        ),
        const SizedBox(
          height: 40,
        ),
        const SizedBox(
          width: 738,
          child: Text(
            'Nosso foco é a segurança em viagem, por isso, suas informações pessoais são tratadas com ética e as documentações necessárias enviadas no seu e-mail.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeightHelper.regular,
              color: AppColors.hopeBlack,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 80,
        ),
        FeedbackWidget(
          resolution: resolution,
          customMessage: const Text.rich(
            TextSpan(
              text: 'Acompanhamos você',
              children: [
                TextSpan(
                  text: ' antes, durante e depois da viagem',
                  style: TextStyle(
                    fontWeight: FontWeightHelper.semiBold,
                  ),
                ),
              ],
            ),
            style: TextStyle(
              height: 1.2,
              fontSize: 24,
              fontWeight: FontWeightHelper.extraBold,
              color: AppColors.hopeBlack,
            ),
          ),
        ),
        const SizedBox(
          height: 80,
        ),
      ],
    );
  }
}

Widget _buildNumberContainer({required String number, required String text}) {
  return Container(
    width: 593,
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: AppColors.hopeGrey,
      ),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Text.rich(
      TextSpan(
        text: number,
        children: [
          TextSpan(
            text: text,
            style: const TextStyle(
              fontWeight: FontWeightHelper.regular,
            ),
          ),
        ],
      ),
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeightHelper.bold,
        color: AppColors.hopeBlack,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

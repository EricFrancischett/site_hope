import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';

class OurHistoryWidget extends StatelessWidget {
  final CurrentResolution resolution;
  const OurHistoryWidget({
    super.key,
    required this.resolution,
  });

  @override
  Widget build(BuildContext context) {
    if (resolution == CurrentResolution.isWeb) {
      return _buildWebVersion();
    } else {
      return _buildMobileVersion();
    }
  }

  _buildWebVersion() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nossa História',
                style: TextStyle(
                  color: AppColors.hopeBlack,
                  fontSize: 24,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'A empresa surgiu em meio a pandemia (em 2021) e a escolha da palavra "HOPE" representa a esperança e expectativa que todos viviam em poder voltar a viajar e poder voltar a explorar o mundo.\n\nCom atendimento personalizado e tratamento humano com os viajantes, do começo ao fim da experiência, o casal: Jéssica e Teilor, ajudam cada vez mais pessoas a realizarem seus sonhos, sair da rotina e curtir a vida por uma outra perspectiva.\n\nCom foco em segurança e atendimento próximo ao viajante, o serviço prestado pela HOPE Viagens visa ser referência em viagens de famílias.',
                style: TextStyle(
                  color: AppColors.hopeBlack,
                  fontSize: 16,
                  fontWeight: FontWeightHelper.regular,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              _buildCheckMessage(
                message: 'Estamos localizados em Curitiba, PR',
                isPhone: false,
              ),
              _buildCheckMessage(
                message: 'Somos cristãos',
                isPhone: false,
              ),
              _buildCheckMessage(
                message: 'Temos dois filhos: [nomes]',
                isPhone: false,
              ),
              _buildCheckMessage(
                message: 'Já conhecemos [x] lugares juntos',
                isPhone: false,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 60,
        ),
        SizedBox(
          width: 338,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 389,
                decoration: BoxDecoration(
                  color: AppColors.hopeGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Atendimento, Reservas e Suporte:\n(41) 99641-2016\nSegunda a Sexta: das 09h às 21h\nSábado: das 09h às 16h\nhopeviagens@gmail.com',
                style: TextStyle(
                  color: AppColors.hopeBlack,
                  fontSize: 16,
                  fontWeight: FontWeightHelper.regular,
                ),
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildMobileVersion() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Center(
          child: Text(
            'Nossa História',
            style: TextStyle(
              color: AppColors.hopeBlack,
              fontSize: 24,
              fontWeight: FontWeightHelper.semiBold,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const Center(
          child: SizedBox(
            width: 466,
            child: Text(
              'A empresa surgiu em meio a pandemia (em 2021) e a escolha da palavra "HOPE" representa a esperança e expectativa que todos viviam em poder voltar a viajar e poder voltar a explorar o mundo.\n\nCom atendimento personalizado e tratamento humano com os viajantes, do começo ao fim da experiência, o casal: Jéssica e Teilor, ajudam cada vez mais pessoas a realizarem seus sonhos, sair da rotina e curtir a vida por uma outra perspectiva.\n\nCom foco em segurança e atendimento próximo ao viajante, o serviço prestado pela HOPE Viagens visa ser referência em viagens de famílias.',
              style: TextStyle(
                color: AppColors.hopeBlack,
                fontSize: 16,
                fontWeight: FontWeightHelper.regular,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildCheckMessage(
              message: 'Estamos localizados em Curitiba, PR',
              isPhone: resolution == CurrentResolution.isCellPhone,
            ),
            _buildCheckMessage(
              message: 'Somos cristãos',
              isPhone: resolution == CurrentResolution.isCellPhone,
            ),
            _buildCheckMessage(
              message: 'Temos dois filhos: [nomes]',
              isPhone: resolution == CurrentResolution.isCellPhone,
            ),
            _buildCheckMessage(
              message: 'Já conhecemos [x] lugares juntos',
              isPhone: resolution == CurrentResolution.isCellPhone,
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Center(
          child: Container(
            height: 389,
            width: 338,
            decoration: BoxDecoration(
              color: AppColors.hopeGrey,
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          'Atendimento, Reservas e Suporte:\n(41) 99641-2016\nSegunda a Sexta: das 09h às 21h\nSábado: das 09h às 16h\nhopeviagens@gmail.com',
          style: TextStyle(
            color: AppColors.hopeBlack,
            fontSize: 16,
            fontWeight: FontWeightHelper.regular,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

Widget _buildCheckMessage({required String message, required bool isPhone}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.check_circle_outline_rounded,
        color: AppColors.hopeOrange,
        size: isPhone ? 24 : 38,
      ),
      SizedBox(
        width: isPhone? 8 : 16,
      ),
      Text(
        message,
        style: TextStyle(
          color: AppColors.hopeOrange,
          fontSize: isPhone ? 12 : 16,
          fontWeight: FontWeightHelper.bold,
        ),
      ),
    ],
  );
}

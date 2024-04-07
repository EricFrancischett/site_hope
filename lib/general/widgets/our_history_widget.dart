import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/widgets/our_story_video_widget.dart';

class OurHistoryWidget extends StatelessWidget {
  final CurrentResolution resolution;
  final String videoUrl;
  const OurHistoryWidget({
    super.key,
    required this.resolution,
    required this.videoUrl,
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OurStoryVideoWidget(
          videoUrl: videoUrl,
          resolution: resolution,
        ),
        const SizedBox(
          width: 60,
        ),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nossa História',
                style: TextStyle(
                  color: AppColors.hopeBlack,
                  fontSize: 24,
                  fontWeight: FontWeightHelper.semiBold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'A empresa surgiu em meio a pandemia (em 2021) e a escolha da palavra "HOPE" representa a esperança e expectativa que todos viviam em poder voltar a viajar e poder voltar a explorar o mundo.\n\nCom atendimento personalizado e tratamento humano com os viajantes, do começo ao fim da experiência, o casal: Jéssica e Teilor, ajudam cada vez mais pessoas a realizarem seus sonhos, sair da rotina e curtir a vida por uma outra perspectiva.\n\nCom foco em segurança e atendimento próximo ao viajante, o serviço prestado pela HOPE Viagens visa ser referência em viagens de famílias.',
                style: TextStyle(
                  color: AppColors.hopeBlack,
                  fontSize: 16,
                  fontWeight: FontWeightHelper.regular,
                ),
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
        OurStoryVideoWidget(
          videoUrl: videoUrl,
          resolution: resolution,
        ),
      ],
    );
  }
}

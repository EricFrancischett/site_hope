import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/widgets/app_custom_button.dart';

class InformativeWidget extends StatelessWidget {
  final String imageUrl;
  final CurrentResolution resolution;
  const InformativeWidget({
    super.key,
    required this.resolution,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return resolution == CurrentResolution.isWeb ? _buildWeb() : _buildMobile();
  }

  Widget _buildMobile() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text.rich(
              TextSpan(
                text: 'Atendimento\n',
                children: [
                  TextSpan(
                    text: '100% online',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: ' e\npersonalizado!',
                  ),
                ],
              ),
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeightHelper.semiBold,
                color: AppColors.hopeOrange,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 23,
            ),
            const Text(
              'Com foco em segurança,\nnosso serviço é referência\nem viagens de famílias.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeightHelper.medium,
                color: AppColors.hopeBlack,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 222,
              child: AppCustomButton(
                title: 'Clique aqui e saiba mais!',
                onTap: () {},
                fontWeight: FontWeightHelper.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Viaje sem burocracia.',
              style: TextStyle(
                color: AppColors.hopeOrange,
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeightHelper.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const SizedBox(
          height: 80,
        ),
        TipsWidget(
          imageUrl: imageUrl,
        ),
      ],
    );
  }

  Widget _buildWeb() {
    return SizedBox(
      height: 375,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text.rich(
                TextSpan(
                  text: 'Atendimento\n',
                  children: [
                    TextSpan(
                      text: '100% online',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: ' e\npersonalizado!',
                    ),
                  ],
                ),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeightHelper.semiBold,
                  color: AppColors.hopeOrange,
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              const Text(
                'Com foco em segurança, nosso serviço\né referência em viagens de famílias.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeightHelper.medium,
                  color: AppColors.hopeBlack,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 375,
                child: AppCustomButton(
                  title: 'Clique aqui e saiba mais sobre a nossa história!',
                  onTap: () {},
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Viaje sem burocracia.',
                style: TextStyle(
                  color: AppColors.hopeOrange,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeightHelper.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 78,
          ),
          TipsWidget(
            imageUrl: imageUrl,
          ),
        ],
      ),
    );
  }
}

class TipsWidget extends StatefulWidget {
  final String imageUrl;
  const TipsWidget({super.key, required this.imageUrl});

  @override
  State<TipsWidget> createState() => _TipsWidgetState();
}

class _TipsWidgetState extends State<TipsWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 262,
          width: 411,
          child: Stack(
            alignment: Alignment.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 154,
                    width: 411,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.imageUrl,
                        ),
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16),
                      ),
                    ),
                  ),
                  Container(
                    height: 108,
                    width: 411,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 18,
                    ),
                    decoration: const BoxDecoration(
                      color: AppColors.hopeWhite,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      border: Border(
                        left: BorderSide(
                          color: AppColors.hopeGrey,
                          width: 1,
                        ),
                        right: BorderSide(
                          color: AppColors.hopeGrey,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: AppColors.hopeGrey,
                          width: 1,
                        ),
                      ),
                    ),
                    child: const Text(
                      'Como fazer um planejamento de viagem em família?',
                      style: TextStyle(
                        fontWeight: FontWeightHelper.semiBold,
                        fontSize: 24,
                        color: AppColors.hopeBlack,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: -16,
                child: SizedBox(
                  width: 215,
                  child: AppCustomButton(
                    title: 'Confira mais dicas aqui!',
                    onTap: () {},
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

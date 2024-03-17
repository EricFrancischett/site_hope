import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';

class FaqWidget extends StatelessWidget {
  final CurrentResolution resolution;
  final String imageUrl;
  const FaqWidget({
    super.key,
    required this.resolution,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (resolution == CurrentResolution.isWeb) ...{
          Container(
            width: 423,
            height: 715,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.fitHeight,
              ),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
        },
        const Flexible(
          child: SizedBox(
            width: 420,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'PERGUNTAS FREQUENTES',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.hopeOrange,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                FaqQuestionWidget(
                  question: 'Quais destinos a HOPE oferece para viagens?',
                  answer:
                      'A HOPE oferece uma ampla variedade de destinos nacionais e internacionais, adaptando-se aos diferentes gostos e preferências dos viajantes.',
                ),
                SizedBox(
                  height: 8,
                ),
                FaqQuestionWidget(
                  question:
                      'Como faço para reservar passagens aéreas com a HOPE?',
                  answer:
                      'A reserva de passagens aéreas com a HOPE pode ser feita de maneira fácil e segura. Entre em contato conosco para obter informações detalhadas, receber cotações e efetuar sua reserva.',
                ),
                SizedBox(
                  height: 8,
                ),
                FaqQuestionWidget(
                  question:
                      'Quais serviços estão incluídos nos pacotes de viagem da HOPE?',
                  answer:
                      'Nossos pacotes de viagem incluem passagens aéreas, hospedagem, aluguel de carro, opções de passeios, traslados, e, em alguns casos, serviços adicionais como seguro de viagem e passeios guiados.',
                ),
                SizedBox(
                  height: 8,
                ),
                FaqQuestionWidget(
                  question:
                      'Como posso entrar em contato com a HOPE em caso de emergência durante a viagem?',
                  answer:
                      'Durante a viagem, a HOPE disponibiliza canais de contato de emergência para garantir assistência rápida e eficiente aos nossos clientes. Envie uma mensagem ou ligue no (41) 99641-2016',
                ),
                SizedBox(
                  height: 8,
                ),
                FaqQuestionWidget(
                  question: 'A HOPE oferece seguro de viagem?',
                  answer:
                      'Sim, a HOPE oferece opções de seguro de viagem para proporcionar mais tranquilidade e segurança aos nossos viajantes.',
                ),
                SizedBox(
                  height: 8,
                ),
                FaqQuestionWidget(
                  question: 'Posso personalizar meu próprio pacote de viagem?',
                  answer:
                      'Sim, é possível personalizar pacotes de viagem de acordo com suas preferências e necessidades. Fale conosco para criar a viagem dos seus sonhos.',
                ),
                SizedBox(
                  height: 8,
                ),
                FaqQuestionWidget(
                  question:
                      'Quais são as políticas de cancelamento e reembolso da HOPE?',
                  answer:
                      'As políticas variam conforme o tipo de reserva e destinos. Informações detalhadas serão fornecidas durante o processo de reserva.',
                ),
                SizedBox(
                  height: 8,
                ),
                FaqQuestionWidget(
                  question: 'A HOPE emite passaportes?',
                  answer:
                      'A HOPE não emite passaportes, mas oferecemos suporte e informações sobre o processo de obtenção.',
                ),
                SizedBox(
                  height: 8,
                ),
                FaqQuestionWidget(
                  question: 'Quais são as opções de pagamento disponíveis?',
                  answer:
                      'Aceitamos diversas formas de pagamento, proporcionando flexibilidade e conveniência aos nossos clientes.',
                ),
                SizedBox(
                  height: 8,
                ),
                FaqQuestionWidget(
                  question:
                      'A HOPE tem pacotes especiais para famílias com crianças?',
                  answer:
                      'Sim, a HOPE oferece pacotes especiais para famílias, considerando necessidades específicas para tornar a experiência de viagem ainda mais agradável. Entre em contato para mais detalhes.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FaqQuestionWidget extends StatefulWidget {
  final String question;
  final String answer;
  const FaqQuestionWidget({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  State<FaqQuestionWidget> createState() => _FaqQuestionWidgetState();
}

class _FaqQuestionWidgetState extends State<FaqQuestionWidget> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: ExpansionTile(
        initiallyExpanded: false,
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        childrenPadding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          side: BorderSide(
            color: AppColors.hopeOrange,
            width: 2,
          ),
        ),
        collapsedShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          side: BorderSide(
            color: AppColors.hopeGrey,
            width: 1,
          ),
        ),
        title: Text(
          widget.question,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeightHelper.semiBold,
            color: isExpanded ? AppColors.hopeOrange : AppColors.hopeBlack,
          ),
        ),
        children: [
          Text(
            widget.answer,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeightHelper.regular,
              color: AppColors.hopeBlack,
            ),
          )
        ],
      ),
    );
  }
}

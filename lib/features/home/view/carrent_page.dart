import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/custom_app_bar/pages_enum.dart';
import 'package:site_hope/general/custom_overlay.dart';
import 'package:site_hope/general/db_carrent_entity.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/custom_app_bar/app_bar_widget.dart';
import 'package:site_hope/general/widgets/app_footer.dart';
import 'package:site_hope/general/widgets/car_partners_widget.dart';
import 'package:site_hope/general/widgets/intro_carrent_widget.dart';

class CarRentPage extends StatefulWidget {
  const CarRentPage({
    super.key,
  });

  @override
  State<CarRentPage> createState() => _CarRentPageState();
}

class _CarRentPageState extends State<CarRentPage> {
  bool isLoading = true;
  bool hasError = false;
  DocumentReference home =
      FirebaseFirestore.instance.collection('home').doc('carrent');
  late DbCarRentEntity entity;
  @override
  void initState() {
    setup();
    super.initState();
  }

  Future<void> setup() async {
    try {
      final DocumentSnapshot homeSnapshot = await home.get();
      entity =
          DbCarRentEntity.fromMap(homeSnapshot.data()! as Map<String, dynamic>);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final resolution = Resolutions.getResolution(context: context);
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: AppColors.hopeOrange,
            ),
          )
        : hasError
            ? const Center(
                child: Icon(
                  Icons.error_outline_rounded,
                  color: AppColors.hopeOrange,
                  size: 40,
                ),
              )
            : SafeArea(
              child: AnnotatedRegion(
                value: CustomOverlay.hopeOverlay,
                child: Scaffold(
                    backgroundColor: AppColors.hopeWhite,
                    body: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(
                              resolution == CurrentResolution.isWeb ? 40 : 30,
                            ),
                            child: AppBarWidget(
                              resolution: resolution,
                              currentPage: PagesEnum.carRent,
                            ),
                          ),
                          Center(
                            child: SizedBox(
                              width: 1024,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: resolution == CurrentResolution.isWeb
                                      ? 40
                                      : 30,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    IntroCarRentWidget(
                                      imageUrl: entity.carRentPicUrl,
                                    ),
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    CarPartnersWidget(
                                      partnersLogoUrl: entity.logosUrl,
                                    ),
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    Center(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _buildInformativeWidget(
                                            title: 'Reservas online',
                                            itens: [
                                              'Escolha o destino e as datas desejadas.',
                                              'Selecione o tipo de carro e características desejadas.',
                                              'Realize a reserva com a gente.',
                                            ],
                                          ),
                                          _buildInformativeWidget(
                                            title: 'Documentação necessária',
                                            itens: [
                                              'Certifique-se de ter os documentos necessários:\ncarteira de motorista, identidade ou passaporte,\ne cartão de crédito.',
                                            ],
                                          ),
                                          _buildInformativeWidget(
                                            title: 'Retirada do Veículo',
                                            itens: [
                                              'Dirija-se à locadora no dia e horário agendados.',
                                              'Apresente os documentos e o voucher de reserva.',
                                              'Realize a vistoria do veículo antes de retirá-lo.',
                                            ],
                                          ),
                                          _buildInformativeWidget(
                                            title: 'Pagamento e Caução',
                                            itens: [
                                              'Efetue o pagamento do aluguel e eventuais taxas adicionais.',
                                              'Deixe um caução no cartão de crédito para cobrir possíveis danos.',
                                            ],
                                          ),
                                          _buildInformativeWidget(
                                            isLast: true,
                                            title: 'Devolução do Veículo',
                                            itens: [
                                              'Devolva o carro na data e local combinados.',
                                              'Realize uma nova vistoria para garantir que o veículo está em condições adequadas.',
                                              'Finalize o processo e aproveite sua viagem!',
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          AppFooter(
                            resolution: resolution,
                          ),
                        ],
                      ),
                    ),
                  ),
              ),
            );
  }

  Widget _buildInformativeWidget({
    bool isLast = false,
    required String title,
    required List<String> itens,
  }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: -3,
          top: -4,
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.hopeOrange,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: isLast
                ? null
                : const Border(
                    left: BorderSide(
                      color: AppColors.hopeOrange,
                      width: 2,
                    ),
                  ),
          ),
          padding: const EdgeInsets.only(left: 30),
          child: Transform.translate(
            offset: const Offset(0, -16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.hopeOrange,
                    fontSize: 24,
                    fontWeight: FontWeightHelper.extraBold,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                ...itens.map((e) {
                  int index = itens.indexOf(e);
                  return Text.rich(
                    TextSpan(
                      text: '0${index + 1}. ',
                      style: const TextStyle(
                        color: AppColors.hopeBlack,
                        fontSize: 14,
                        fontWeight: FontWeightHelper.extraBold,
                        fontStyle: FontStyle.italic,
                        height: 1.1,
                      ),
                      children: [
                        TextSpan(
                          text: e,
                          style: const TextStyle(
                            fontWeight: FontWeightHelper.semiBold,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

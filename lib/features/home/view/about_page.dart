import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/custom_app_bar/custom_app_bar.dart';
import 'package:site_hope/general/custom_app_bar/custom_app_bar_mobile.dart';
import 'package:site_hope/general/custom_app_bar/pages_enum.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/widgets/app_footer.dart';
import 'package:site_hope/general/widgets/custom_trip_card.dart';
import 'package:site_hope/general/widgets/our_history_widget.dart';
import 'package:site_hope/general/widgets/our_service_widge.dart';
import 'package:site_hope/general/widgets/religious_quotes.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final resolution = Resolutions.getResolution(context: context);
    return Scaffold(
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment:
                        resolution != CurrentResolution.isCellPhone
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.center,
                    children: [
                      Visibility(
                        visible: resolution != CurrentResolution.isCellPhone,
                        child: Container(
                          width: 98,
                          height: 48,
                          color: AppColors.hopeOrange,
                        ),
                      ),
                      const Text(
                        'Faça a sua reserva (41) 99641-2016',
                        style: TextStyle(
                          color: AppColors.hopeGrey,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  if (resolution != CurrentResolution.isCellPhone) ...{
                    const CustomAppBar(
                      currentPage: PagesEnum.about,
                    ),
                  } else ...{
                    const CustomAppBarMobile(
                      currentPage: PagesEnum.about,
                    ),
                  },
                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: 1024,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: resolution == CurrentResolution.isWeb ? 40 : 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      const CustomTripCard(),
                      const SizedBox(
                        height: 60,
                      ),
                      const ReligiousQuotes(
                        title:
                            '"Tudo o que fizerem, façam de todo o coração, como para o Senhor..."',
                        subtitle: 'Colossenses 3.23',
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: OurHistoryWidget(
                          resolution: resolution,
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Container(
                        height: 400,
                        decoration: BoxDecoration(
                          color: AppColors.hopeGrey,
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: OurService(
                          resolution: resolution,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            AppFooter(
              resolution: resolution,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(
                  resolution == CurrentResolution.isWeb ? 40 : 30,
                ),
                child: Text(
                  'Todos os direitos reservados para o site HOPE Viagens © 2024${resolution == CurrentResolution.isWeb ? '  |  ' : '\n'}Site desenvolvido por: Turbo Design.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.hopeGrey,
                    fontSize: 14,
                    fontWeight: FontWeightHelper.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

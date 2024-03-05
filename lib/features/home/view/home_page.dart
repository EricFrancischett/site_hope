import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/custom_app_bar/custom_app_bar.dart';
import 'package:site_hope/general/custom_app_bar/custom_app_bar_mobile.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/widgets/app_footer.dart';
import 'package:site_hope/general/widgets/destination_widget.dart';
import 'package:site_hope/general/widgets/faq_widget.dart';
import 'package:site_hope/general/widgets/feedback_widget.dart';
import 'package:site_hope/general/widgets/hilghlight_packs_widget.dart';
import 'package:site_hope/general/widgets/hotels_widget.dart';
import 'package:site_hope/general/widgets/informative_widget.dart';
import 'package:site_hope/general/widgets/intro_widget.dart';
import 'package:site_hope/general/widgets/main_offer_card_widget.dart';
import 'package:site_hope/general/widgets/main_offer_card_widget_phone.dart';
import 'package:site_hope/general/widgets/tickets_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  if (resolution == CurrentResolution.isWeb) ...{
                    const CustomAppBar(),
                  } else ...{
                    const CustomAppBarMobile(),
                  },
                ],
              ),
            ),
            Center(
              child: SizedBox(
                width: 1024,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(
                        resolution == CurrentResolution.isWeb ? 40 : 30,
                      ),
                      child: const IntroWidget(),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Center(
                      child: TicketsWidget(),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                        resolution == CurrentResolution.isWeb ? 40 : 30,
                      ),
                      child: resolution == CurrentResolution.isCellPhone
                          ? const MainOfferCardWidgetPhone()
                          : const MainOfferCardWidget(),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Center(
                      child: DestinationWidget(),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    const Center(
                      child: HighlightPacksWidget(),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            resolution == CurrentResolution.isWeb ? 40 : 30,
                      ),
                      child: HotelsWidget(
                        resolution: resolution,
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
            FeedbackWidget(
              resolution: resolution,
            ),
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: resolution == CurrentResolution.isWeb ? 40 : 30,
                ),
                child: SizedBox(
                  width: 1024,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InformativeWidget(
                        resolution: resolution,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: FaqWidget(
                  resolution: resolution,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
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

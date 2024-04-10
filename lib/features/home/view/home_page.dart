import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/custom_app_bar/pages_enum.dart';
import 'package:site_hope/general/custom_scroll_keys.dart';
import 'package:site_hope/general/db_home_entity.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/custom_app_bar/app_bar_widget.dart';
import 'package:site_hope/general/widgets/app_footer.dart';
import 'package:site_hope/general/widgets/destination_widget.dart';
import 'package:site_hope/general/widgets/faq_widget.dart';
import 'package:site_hope/general/widgets/hilghlight_packs_widget.dart';
import 'package:site_hope/general/widgets/hotels_widget.dart';
import 'package:site_hope/general/widgets/informative_widget.dart';
import 'package:site_hope/general/widgets/intro_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  bool hasError = false;
  DocumentReference home =
      FirebaseFirestore.instance.collection('home').doc('homepage');
  late DbHomeEntity entity;
  @override
  void initState() {
    setup();
    super.initState();
  }

  Future<void> setup() async {
    try {
      final DocumentSnapshot homeSnapshot = await home.get();
      entity =
          DbHomeEntity.fromMap(homeSnapshot.data()! as Map<String, dynamic>);
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
            : Scaffold(
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
                          currentPage: PagesEnum.home,
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
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      resolution == CurrentResolution.isWeb
                                          ? 40
                                          : 30,
                                ),
                                child: IntroWidget(
                                  imageUrl: entity.homePicUrl,
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              // Padding(
                              //   key: CustomScrollKeys.ticketsKey,
                              //   padding: const EdgeInsets.symmetric(
                              //     vertical: 30,
                              //   ),
                              //   child: const Center(
                              //     child: TicketsWidget(),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 10,
                              // ),
                              // Padding(
                              //   padding: EdgeInsets.all(
                              //     resolution == CurrentResolution.isWeb
                              //         ? 40
                              //         : 30,
                              //   ),
                              //   child: MainOfferCardWidget(
                              //     resolution: resolution,
                              //     title: entity.mainOffer.title,
                              //     description: entity.mainOffer.description,
                              //     price: entity.mainOffer.price,
                              //     paymentType: entity.mainOffer.payment,
                              //     imageUrl: entity.mainOffer.imageUrl,
                              //   ),
                              // ),
                              const SizedBox(
                                height: 40,
                              ),
                              Center(
                                child: DestinationWidget(
                                  destinations: entity.destinations,
                                ),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              Padding(
                                key: CustomScrollKeys.packagesKey,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 30,
                                ),
                                child: Center(
                                  child: HighlightPacksWidget(
                                    packs: entity.packs,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Padding(
                                key: CustomScrollKeys.hotelsKey,
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      resolution == CurrentResolution.isWeb
                                          ? 40
                                          : 30,
                                  vertical: 30,
                                ),
                                child: HotelsWidget(
                                  resolution: resolution,
                                  hotels: entity.hotels,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                resolution == CurrentResolution.isWeb ? 40 : 30,
                          ),
                          child: SizedBox(
                            width: 1024,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                InformativeWidget(
                                  resolution: resolution,
                                  imageUrl: entity.serviceImageUrl,
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
                            imageUrl: entity.faqImageUrl,
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
              );
  }
}

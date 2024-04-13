import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/custom_app_bar/pages_enum.dart';
import 'package:site_hope/general/db_about_entity.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/custom_app_bar/app_bar_widget.dart';
import 'package:site_hope/general/widgets/app_footer.dart';
import 'package:site_hope/general/widgets/custom_trip_card.dart';
import 'package:site_hope/general/widgets/our_history_widget.dart';
import 'package:site_hope/general/widgets/our_service_widge.dart';
import 'package:site_hope/general/widgets/religious_quotes.dart';

// ignore: must_be_immutable
class AboutPage extends StatefulWidget {
  const AboutPage({
    super.key,
  });

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool isLoading = true;
  bool hasError = false;
  DocumentReference home =
      FirebaseFirestore.instance.collection('home').doc('aboutpage');
  late DbAboutEntity entity;
  @override
  void initState() {
    setup();
    super.initState();
  }

  Future<void> setup() async {
    try {
      final DocumentSnapshot homeSnapshot = await home.get();
      entity =
          DbAboutEntity.fromMap(homeSnapshot.data()! as Map<String, dynamic>);
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
                          currentPage: PagesEnum.about,
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 60,
                                ),
                                CustomTripCard(
                                  imageUrl: entity.aboutPicUrl,
                                ),
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
                                    videoUrl: entity.ourStoryVideoUrl,
                                    thumbOurStory: entity.thumbOurStory, 
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
                    ],
                  ),
                ),
              );
  }
}

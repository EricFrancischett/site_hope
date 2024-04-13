import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/custom_app_bar/pages_enum.dart';
import 'package:site_hope/general/custom_overlay.dart';
import 'package:site_hope/general/db_carrent_entity.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/custom_app_bar/app_bar_widget.dart';
import 'package:site_hope/general/widgets/app_footer.dart';
import 'package:site_hope/general/widgets/hotels_grid_widget.dart';
import 'package:site_hope/general/widgets/intro_carrent_widget.dart';

class HotelsPage extends StatefulWidget {
  const HotelsPage({
    super.key,
  });

  @override
  State<HotelsPage> createState() => _HotelsPageState();
}

class _HotelsPageState extends State<HotelsPage> {
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
                              currentPage: PagesEnum.hotels,
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
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          const HotelsGridWidget(),
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
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/feedback_entity.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/widgets/feedback_card_widget.dart';
import 'package:site_hope/general/widgets/feedback_video_dialog.dart';

class FeedbackWidget extends StatefulWidget {
  final CurrentResolution resolution;
  final Widget? customMessage;
  const FeedbackWidget({
    super.key,
    required this.resolution,
    this.customMessage,
  });

  @override
  State<FeedbackWidget> createState() => _FeedbackWidgetState();
}

class _FeedbackWidgetState extends State<FeedbackWidget> {
  bool isLoading = true;
  bool hasError = false;
  DocumentReference home =
      FirebaseFirestore.instance.collection('home').doc('feedback');
  late List<FeedBackEntity> feedBacks;
  @override
  void initState() {
    setup();
    super.initState();
  }

  Future<void> setup() async {
    try {
      final DocumentSnapshot homeSnapshot = await home.get();
      final Map<String, dynamic> response =
          homeSnapshot.data() as Map<String, dynamic>;
      final List<Map<String, dynamic>> feedbacks =
          (response['feedbacks'] as List<dynamic>).cast<Map<String, dynamic>>();
      feedBacks = feedbacks.map((e) => FeedBackEntity.fromMap(e)).toList();
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
    Widget message = const SizedBox();
    if (widget.customMessage == null) {
      message = const Text.rich(
        TextSpan(
          text: 'Ouça ',
          children: [
            TextSpan(
              text: 'quem já viajou',
              style: TextStyle(
                fontWeight: FontWeightHelper.extraBold,
              ),
            ),
            TextSpan(
              text: ' com a ',
            ),
            TextSpan(
              text: 'HOPE',
              style: TextStyle(
                fontWeight: FontWeightHelper.extraBold,
              ),
            ),
          ],
        ),
        style: TextStyle(
          height: 1.2,
          fontSize: 24,
          fontWeight: FontWeightHelper.semiBold,
          color: AppColors.hopeBlack,
        ),
      );
    } else {
      message = widget.customMessage!;
    }
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
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: message,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      itemCount: feedBacks.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    surfaceTintColor: AppColors.hopeWhite,
                                    backgroundColor: AppColors.hopeWhite,
                                    child: Container(
                                      width: (widget.resolution ==
                                                  CurrentResolution.isCellPhone
                                              ? 200
                                              : 282) +
                                          60,
                                      padding: const EdgeInsets.all(30),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    feedBacks[index].name,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      color:
                                                          AppColors.hopeBlack,
                                                      fontWeight:
                                                          FontWeightHelper
                                                              .semiBold,
                                                      height: 1,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    feedBacks[index].locale,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      color:
                                                          AppColors.hopeBlack,
                                                      fontWeight:
                                                          FontWeightHelper
                                                              .semiBold,
                                                      height: 1,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              IconButton(
                                                icon: const Icon(Icons.close),
                                                onPressed:
                                                    Navigator.of(context).pop,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          FeedbackVideoDialog(
                                            videoUrl: feedBacks[index].videoUrl,
                                            resolution: widget.resolution,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: FeedbackCardWidget(
                              feedback: feedBacks[index],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 20,
                        );
                      },
                    ),
                  ),
                ],
              );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/feedback_entity.dart';
import 'package:site_hope/general/font_weight_helper.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/widgets/feedback_card_widget.dart';

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
          response['feedbacks'] as List<Map<String, dynamic>>;
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
              strokeWidth: 10,
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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: widget.resolution == CurrentResolution.isWeb
                            ? 40
                            : 30,
                      ),
                      child: message,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  FeedbackCardWidget(
                    feedback: feedBacks[0],
                  ),
                ],
              );
  }
}

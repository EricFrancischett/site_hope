import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/custom_app_bar/custom_app_bar.dart';
import 'package:site_hope/general/custom_app_bar/custom_app_bar_mobile.dart';
import 'package:site_hope/general/font_weight_helper_enum.dart';
import 'package:site_hope/general/resolutions.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: resolution != CurrentResolution.isCellPhone
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
              const SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                  width: 534,
                  child: Text(
                    '“May the God of HOPE fill you with all joy and peace as you trust in him, so that you may overflow with HOPE by the power of the Holy Spirit.”',
                    style: TextStyle(
                      fontWeight: FontWeightHelperEnum.semiBold.fontWeight,
                      fontSize: 14,
                      color: AppColors.hopeOrange,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Text(
                'Rm 15:13',
                style: TextStyle(
                  fontWeight: FontWeightHelperEnum.light.fontWeight,
                  fontSize: 12,
                  color: AppColors.hopeOrange,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

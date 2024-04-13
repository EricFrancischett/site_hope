import 'package:flutter/services.dart';
import 'package:site_hope/general/app_colors.dart';

class CustomOverlay {
  static const SystemUiOverlayStyle hopeOverlay = SystemUiOverlayStyle(
    systemNavigationBarDividerColor: AppColors.hopeOrange,
    statusBarColor: AppColors.hopeOrange,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.hopeOrange,
    systemNavigationBarIconBrightness: Brightness.dark,
  );
}
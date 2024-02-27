import 'package:flutter/material.dart';

class Resolutions {
  static CurrentResolution getResolution({required BuildContext context}) {
    final width = MediaQuery.sizeOf(context).width;
    if (width <= 768) {
      return CurrentResolution.isCellPhone;
    } else if (width > 768 && width <= 1024) {
      return CurrentResolution.isTablet;
    } else {
      return CurrentResolution.isWeb;
    }
  }
}

enum CurrentResolution {
  isCellPhone,
  isTablet,
  isWeb,
}

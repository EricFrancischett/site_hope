import 'package:flutter/material.dart';

enum FontWeightHelperEnum {
  thin(fontWeight: FontWeight.w100),
  extraLight(fontWeight: FontWeight.w200),
  light(fontWeight: FontWeight.w300),
  regular(fontWeight: FontWeight.w400),
  medium(fontWeight: FontWeight.w500),
  semiBold(fontWeight: FontWeight.w600),
  bold(fontWeight: FontWeight.w700),
  extraBold(fontWeight: FontWeight.w800),
  black(fontWeight: FontWeight.w900);

  final FontWeight fontWeight;
  const FontWeightHelperEnum({required this.fontWeight});
}

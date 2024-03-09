import 'package:flutter/material.dart';
import 'package:site_hope/app_widget.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const AppWidget());
}
import 'package:flutter/material.dart';
import 'package:site_hope/features/home/view/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Montserrat',
      ),
      home: const HomePage(),
    );
  }
}
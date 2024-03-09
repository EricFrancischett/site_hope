import 'package:flutter/material.dart';
import 'package:site_hope/general/router_generator.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Montserrat',
      ),
      routerConfig: RouterGenerator.router,
    );
  }
}

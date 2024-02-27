import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';

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
    return Scaffold(
      backgroundColor: AppColors.hopeOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hello, World!',
              style: TextStyle(
                fontSize: 24,
                color: AppColors.hopeWhite,
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: AppColors.hopeBlack,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const Text(
              'Hello, World!',
              style: TextStyle(
                fontSize: 24,
                color: AppColors.hopeYellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

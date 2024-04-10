import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/custom_app_bar/pages_enum.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/custom_app_bar/app_bar_widget.dart';
import 'package:site_hope/general/widgets/app_footer.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final resolution = Resolutions.getResolution(context: context);
    return Scaffold(
      backgroundColor: AppColors.hopeWhite,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(
                resolution == CurrentResolution.isWeb ? 40 : 30,
              ),
              child: AppBarWidget(
                resolution: resolution,
                currentPage: PagesEnum.blog,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            const Center(
              child: Text(
                'Ainda não postamos nada por aqui!',
                style: TextStyle(
                  color: AppColors.hopeBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            AppFooter(
              resolution: resolution,
            ),
          ],
        ),
      ),
    );
  }
}

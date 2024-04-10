import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/custom_app_bar/custom_app_bar.dart';
import 'package:site_hope/general/custom_app_bar/custom_app_bar_mobile.dart';
import 'package:site_hope/general/custom_app_bar/pages_enum.dart';
import 'package:site_hope/general/image_constants.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:site_hope/general/url_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AppBarWidget extends StatelessWidget {
  final CurrentResolution resolution;
  final PagesEnum currentPage;
  const AppBarWidget({
    super.key,
    required this.resolution,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: resolution != CurrentResolution.isCellPhone
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            Visibility(
              visible: resolution != CurrentResolution.isCellPhone,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    context.go('/');
                  },
                  child: SvgPicture.asset(
                    ImageConstants.hopeLogo,
                  ),
                ),
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  await launchUrl(
                    Uri.parse(
                      UrlConstants.whatsApp,
                    ),
                    mode: LaunchMode.externalApplication,
                  );
                },
                child: const Text(
                  'Faça a sua reserva (41) 99641-2016',
                  style: TextStyle(
                    color: AppColors.hopeGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        if (resolution != CurrentResolution.isCellPhone) ...{
          CustomAppBar(
            currentPage: currentPage,
          ),
        } else ...{
          CustomAppBarMobile(
            currentPage: currentPage,
          ),
        },
      ],
    );
  }
}

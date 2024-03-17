import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';

class DestinationCardWidget extends StatefulWidget {
  final String title;
  final String imageUrl;
  final int index;
  const DestinationCardWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.index,
  });

  @override
  State<DestinationCardWidget> createState() => _DestinationCardWidgetState();
}

class _DestinationCardWidgetState extends State<DestinationCardWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          height: 201,
          width: 196,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: 168,
                        width: 196,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.imageUrl,
                            ),
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -10,
                        child: Container(
                          width: 59,
                          height: 20,
                          decoration: BoxDecoration(
                            color: AppColors.hopeYellow,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              'T0P 0${widget.index}',
                              style: const TextStyle(
                                fontWeight: FontWeightHelper.black,
                                fontSize: 10,
                                color: AppColors.hopeBlack,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 33,
                    width: 196,
                    decoration: const BoxDecoration(
                      color: AppColors.hopeWhite,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      border: Border(
                        left: BorderSide(
                          color: AppColors.hopeGrey,
                          width: 1,
                        ),
                        right: BorderSide(
                          color: AppColors.hopeGrey,
                          width: 1,
                        ),
                        bottom: BorderSide(
                          color: AppColors.hopeGrey,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontWeight: isHovered
                              ? FontWeightHelper.black
                              : FontWeightHelper.semiBold,
                          fontSize: 14,
                          color: AppColors.hopeBlack,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/font_weight_helper.dart';

class AppBarButton extends StatefulWidget {
  final Function()? onTap;
  final String text;
  final bool isSelected;
  final Color fontColor;
  final Color hoverColor;
  final Color selectedColor;
  const AppBarButton({
    super.key,
    this.onTap,
    required this.text,
    this.isSelected = false,
    this.fontColor = AppColors.hopeWhite,
    this.hoverColor = AppColors.hopeBlack,
    this.selectedColor = AppColors.hopeBlack,
  });

  @override
  State<AppBarButton> createState() => _AppBarButtonState();
}

class _AppBarButtonState extends State<AppBarButton> {
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
      cursor:
          widget.onTap == null ? MouseCursor.defer : SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedDefaultTextStyle(
          maxLines: 1,
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: isHovered
                ? widget.hoverColor
                : widget.isSelected
                    ? widget.selectedColor
                    : widget.fontColor,
            fontSize: 14,
            fontWeight: (isHovered || widget.isSelected)
                ? FontWeightHelper.extraBold
                : FontWeightHelper.medium,
            overflow: TextOverflow.ellipsis,
            letterSpacing: 0.5,
          ),
          duration: const Duration(
            milliseconds: 200,
          ),
          child: Text(
            widget.text,
          ),
        ),
      ),
    );
  }
}

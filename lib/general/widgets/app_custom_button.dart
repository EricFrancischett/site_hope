import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';

class AppCustomButton extends StatefulWidget {
  final String title;
  final Function() onTap;
  final bool isOrange;
  final FontWeight fontWeight;
  const AppCustomButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.fontWeight,
    this.isOrange = true,
  });

  @override
  State<AppCustomButton> createState() => _AppCustomButtonState();
}

class _AppCustomButtonState extends State<AppCustomButton> {
  bool isHovered = false;
  final Duration _duration = const Duration(milliseconds: 100);
  @override
  Widget build(BuildContext context) {
    final Color mainColor =
        widget.isOrange ? AppColors.hopeOrange : AppColors.hopeYellow;
    final Color hoverColor =
        widget.isOrange ? AppColors.hopeYellow : AppColors.hopeOrange;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (v) {
        setState(
          () {
            isHovered = true;
          },
        );
      },
      onExit: (v) {
        setState(
          () {
            isHovered = false;
          },
        );
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: _duration,
          height: 32,
          decoration: BoxDecoration(
            color: isHovered ? hoverColor : mainColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
          ),
          child: Center(
            child: AnimatedDefaultTextStyle(
              style: DefaultTextStyle.of(context).style.copyWith(
                    fontWeight: widget.fontWeight,
                    fontSize: 14,
                    color: _defineTextColor(
                        isHovered: isHovered, isOrange: widget.isOrange),
                  ),
              duration: _duration,
              child: Text(
                widget.title,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Color _defineTextColor({required bool isHovered, required bool isOrange}) {
  if (isOrange) {
    return isHovered ? AppColors.hopeBlack : AppColors.hopeWhite;
  } else {
    return isHovered ? AppColors.hopeWhite : AppColors.hopeBlack;
  }
}

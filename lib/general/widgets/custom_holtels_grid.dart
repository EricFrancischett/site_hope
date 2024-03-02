import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/resolutions.dart';

class CustomHotelsGrid extends StatefulWidget {
  final CurrentResolution currentResolution;
  final BoxConstraints constraints;
  const CustomHotelsGrid({
    super.key,
    required this.constraints,
    required this.currentResolution,
  });

  @override
  State<CustomHotelsGrid> createState() => _CustomHotelsGridState();
}

class _CustomHotelsGridState extends State<CustomHotelsGrid> {
  late double container1Width;
  late double container1Height;
  late double container2Width;
  late double container2Height;
  late double container3Width;
  late double container3Height;
  late double container4Width;
  late double container4Height;
  late double dividerSize;

  final Duration duration = const Duration(milliseconds: 500);
  final Curve curve = Curves.easeInOut;

  double currentwidth = 0;

  @override
  Widget build(BuildContext context) {
    bool isWeb = widget.currentResolution == CurrentResolution.isWeb;
    double newWidth = MediaQuery.sizeOf(context).width;
    if (currentwidth != newWidth) {
      currentwidth = newWidth;
      _resetSizeAndStartAnimation(
        currentwidth: widget.constraints.maxWidth,
        currentHeight: widget.constraints.maxHeight,
      );
    }
    return SizedBox(
      height: 300,
      child: Row(
        children: [
          MouseRegion(
            onEnter: (event) {
              if (isWeb) {
                _defineSizeAndStartAnimation(
                  cardHovered: 1,
                  currentwidth: widget.constraints.maxWidth,
                  currentHeight: widget.constraints.maxHeight,
                );
              }
            },
            onExit: (event) {
              if (isWeb) {
                _resetSizeAndStartAnimation(
                  currentwidth: widget.constraints.maxWidth,
                  currentHeight: widget.constraints.maxHeight,
                );
              }
            },
            child: AnimatedContainer(
              decoration: BoxDecoration(
                color: AppColors.hopeGrey,
                borderRadius: BorderRadius.circular(30),
              ),
              duration: duration,
              curve: curve,
              width: container1Width,
              height: container1Height,
            ),
          ),
          AnimatedContainer(
            width: dividerSize,
            duration: duration,
            curve: curve,
          ),
          Column(
            children: [
              MouseRegion(
                onEnter: (event) {
                  if (isWeb) {
                    _defineSizeAndStartAnimation(
                      cardHovered: 2,
                      currentwidth: widget.constraints.maxWidth,
                      currentHeight: widget.constraints.maxHeight,
                    );
                  }
                },
                onExit: (event) {
                  if (isWeb) {
                    _resetSizeAndStartAnimation(
                      currentwidth: widget.constraints.maxWidth,
                      currentHeight: widget.constraints.maxHeight,
                    );
                  }
                },
                child: AnimatedContainer(
                  decoration: BoxDecoration(
                    color: AppColors.hopeGrey,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  duration: duration,
                  curve: curve,
                  width: container2Width,
                  height: container2Height,
                ),
              ),
              AnimatedContainer(
                height: dividerSize,
                duration: duration,
                curve: curve,
              ),
              Row(
                children: [
                  MouseRegion(
                    onEnter: (event) {
                      if (isWeb) {
                        _defineSizeAndStartAnimation(
                          cardHovered: 3,
                          currentwidth: widget.constraints.maxWidth,
                          currentHeight: widget.constraints.maxHeight,
                        );
                      }
                    },
                    onExit: (event) {
                      if (isWeb) {
                        _resetSizeAndStartAnimation(
                          currentwidth: widget.constraints.maxWidth,
                          currentHeight: widget.constraints.maxHeight,
                        );
                      }
                    },
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        color: AppColors.hopeGrey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      duration: duration,
                      curve: curve,
                      width: container3Width,
                      height: container3Height,
                    ),
                  ),
                  AnimatedContainer(
                    width: dividerSize,
                    duration: duration,
                    curve: curve,
                  ),
                  MouseRegion(
                    onEnter: (event) {
                      if (isWeb) {
                        _defineSizeAndStartAnimation(
                          cardHovered: 4,
                          currentwidth: widget.constraints.maxWidth,
                          currentHeight: widget.constraints.maxHeight,
                        );
                      }
                    },
                    onExit: (event) {
                      if (isWeb) {
                        _resetSizeAndStartAnimation(
                          currentwidth: widget.constraints.maxWidth,
                          currentHeight: widget.constraints.maxHeight,
                        );
                      }
                    },
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        color: AppColors.hopeGrey,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      duration: duration,
                      curve: curve,
                      width: container4Width,
                      height: container4Height,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _defineSizeAndStartAnimation({
    required int cardHovered,
    required double currentwidth,
    required double currentHeight,
  }) {
    switch (cardHovered) {
      case 1:
        setState(() {
          dividerSize = 0;
          container1Width = currentwidth;
          container1Height = currentHeight;
          container2Width = 0;
          container2Height = 0;
          container3Width = 0;
          container3Height = 0;
          container4Width = 0;
          container4Height = 0;
        });
        break;
      case 2:
        setState(() {
          dividerSize = 0;
          container1Width = 0;
          container1Height = 0;
          container2Width = currentwidth;
          container2Height = currentHeight;
          container3Width = 0;
          container3Height = 0;
          container4Width = 0;
          container4Height = 0;
        });
        break;

      case 3:
        setState(() {
          dividerSize = 0;
          container1Width = 0;
          container1Height = 0;
          container2Width = 0;
          container2Height = 0;
          container3Width = currentwidth;
          container3Height = currentHeight;
          container4Width = 0;
          container4Height = 0;
        });
        break;

      case 4:
        setState(() {
          dividerSize = 0;
          container1Width = 0;
          container1Height = 0;
          container2Width = 0;
          container2Height = 0;
          container3Width = 0;
          container3Height = 0;
          container4Width = currentwidth;
          container4Height = currentHeight;
        });
        break;
    }
  }

  _resetSizeAndStartAnimation({
    required double currentwidth,
    required double currentHeight,
  }) {
    setState(() {
      dividerSize = 12;
      container1Width = (currentwidth - dividerSize) / 2;
      container1Height = currentHeight;
      container2Width = (currentwidth - dividerSize) / 2;
      container2Height = (currentHeight - dividerSize) / 2;
      container3Width = (((currentwidth - dividerSize) / 2) - dividerSize) / 2;
      container3Height = (currentHeight - dividerSize) / 2;
      container4Width = (((currentwidth - dividerSize) / 2) - dividerSize) / 2;
      container4Height = (currentHeight - dividerSize) / 2;
    });
  }
}

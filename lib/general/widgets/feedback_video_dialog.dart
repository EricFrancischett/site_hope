import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:video_player/video_player.dart';

class FeedbackVideoDialog extends StatefulWidget {
  final String videoUrl;
  final CurrentResolution resolution;
  const FeedbackVideoDialog({
    super.key,
    required this.videoUrl,
    required this.resolution,
  });

  @override
  State<FeedbackVideoDialog> createState() => _FeedbackVideoDialogState();
}

class _FeedbackVideoDialogState extends State<FeedbackVideoDialog> {
  bool isHovering = false;
  late VideoPlayerController _controller;

  @override
  void initState() {
    _initVideoPlayer();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initVideoPlayer() async {
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.videoUrl,
      ),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    /// Initialize the video player
    await _controller.initialize().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: MouseRegion(
              onEnter: (event) {
                setState(() {
                  isHovering = true;
                });
              },
              onExit: (event) {
                setState(() {
                  isHovering = false;
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: widget.resolution == CurrentResolution.isCellPhone
                        ? 200
                        : 282,
                    height: widget.resolution == CurrentResolution.isCellPhone
                        ? 356
                        : 502,
                    child: VideoPlayer(
                      _controller,
                    ),
                  ),
                  Visibility(
                    visible: !_controller.value.isPlaying || isHovering,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                        size: 50,
                        color: AppColors.hopeWhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox(
            width: 282,
            height: 502,
            child: Center(
              child: CircularProgressIndicator(
                color: AppColors.hopeOrange,
              ),
            ),
          );
  }
}

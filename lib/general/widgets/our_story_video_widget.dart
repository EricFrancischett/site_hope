import 'package:flutter/material.dart';
import 'package:site_hope/general/app_colors.dart';
import 'package:site_hope/general/resolutions.dart';
import 'package:video_player/video_player.dart';

class OurStoryVideoWidget extends StatefulWidget {
  final String videoUrl;
  final String thumbOurStory;
  final CurrentResolution resolution;
  const OurStoryVideoWidget({
    super.key,
    required this.videoUrl,
    required this.thumbOurStory,
    required this.resolution,
  });

  @override
  State<OurStoryVideoWidget> createState() => _OurStoryVideoWidgetState();
}

class _OurStoryVideoWidgetState extends State<OurStoryVideoWidget> {
  bool isHovering = false;
  bool isVideoInitialized = false;
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
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));

    /// Initialize the video player
    await _controller.initialize().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: widget.resolution == CurrentResolution.isWeb
                ? MouseRegion(
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
                            width: 282,
                            height: 502,
                            child: VideoPlayer(
                              _controller,
                            )),
                        Visibility(
                          visible: !_controller.value.isPlaying || isHovering,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                isVideoInitialized = true;
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
                  )
                : Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      SizedBox(
                        height: 450,
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: isVideoInitialized
                              ? VideoPlayer(
                                  _controller,
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                      image: NetworkImage(widget.thumbOurStory),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isVideoInitialized = true;
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          },
                          icon: Icon(
                            _controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 25,
                            color: AppColors.hopeWhite,
                          ),
                        ),
                      ),
                    ],
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

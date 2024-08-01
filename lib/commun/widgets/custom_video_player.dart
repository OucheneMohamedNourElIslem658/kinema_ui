import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

import '/commun/widgets/custom_network_image.dart';

import '../constents/colors.dart';
import '../constents/text_styles.dart';

class CustomVideoPlayer extends StatefulWidget {
  const CustomVideoPlayer({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.title, 
    this.showTitle = false,
    required this.controller
  });

  final String? title;
  final double? width,height,borderRadius;
  final bool showTitle;
  final VideoPlayerController controller;

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late ChewieController chewieController;
  late String videoDurationInfo;
  late double progresScale;
  late bool isPlaying;
  late bool isMuted;
  bool isBig = false;
  bool isTabBarShown = false;

  void _initVideoController() async {
    progresScale = widget.controller.value.position.inSeconds.toDouble();
    isPlaying = widget.controller.value.isPlaying;
    isMuted =  widget.controller.value.volume == 0; 
    chewieController = ChewieController(
      videoPlayerController: widget.controller,
      showControls: false,
      aspectRatio: 16/9,
      looping: true,
      placeholder: const LoaderWithShimmer(),
      errorBuilder: (context, errorMessage) => const LoaderWithShimmer(),
    );
    videoDurationInfo = _getVideoDurationInfo();
  }

  void toggleVideo(){
    if (isPlaying) {
      widget.controller.pause();
    } else {
      widget.controller.play();
    }
    isPlaying = !isPlaying;
    setState(() {});
  }

  void toggleControllBar(){
    setState(() {
      isTabBarShown = !isTabBarShown;
    });
  }

  void listenToVideoProgres(){
    final status = widget.controller.value;
    updateDurationInfo();
    updateProgresScale(status);
  }

  void updateDurationInfo(){
    videoDurationInfo = _getVideoDurationInfo();
    setState(() {});
  }

  void updateProgresScale(VideoPlayerValue status){
    progresScale = (status.position.inSeconds / status.duration.inSeconds).clamp(0, 1);
    setState(() {});
  }

  void updateProgresScaleManualy(double newValue){
    widget.controller.seekTo(
      Duration(
        seconds: (newValue*widget.controller.value.duration.inSeconds).toInt()
      )
    );
    updateProgresScale(widget.controller.value);
  }

  String _getVideoDurationInfo() => '${_getVideoPlayerProgress()}/${_getVideoPlayerDuration()}';
  String _getVideoPlayerDuration() => _formatDuration(widget.controller.value.duration);
  String _getVideoPlayerProgress() => _formatDuration(widget.controller.value.position);

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  void toggleMutation(){
    if (isMuted) {
      widget.controller.setVolume(1);
    } else {
      widget.controller.setVolume(0);
    }
    isMuted = !isMuted;
    setState(() {});
  }

  void toggleView(){
    if (isBig) {
      chewieController.exitFullScreen();
    } else {
      chewieController.enterFullScreen();
    }
    isBig = chewieController.isFullScreen;
    setState(() {});
  }

  @override
  void initState() {
    _initVideoController();
    widget.controller.addListener(listenToVideoProgres);
    chewieController.addListener(() {
      isBig = chewieController.isFullScreen;
      setState(() {});
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () => toggleControllBar(),
                  child: AspectRatio(
                    aspectRatio: 16/9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
                      child: widget.controller.value.isInitialized ? Chewie(
                        controller:  chewieController,
                      ) : Container(),
                    ),
                  ),
                ),
                isTabBarShown
                ? Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    decoration: BoxDecoration(
                      color: CustomColors.darkBlue.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => toggleVideo(), 
                          child: Icon(
                            !isPlaying
                            ? Icons.play_arrow_rounded
                            : Icons.pause_rounded,
                            color: CustomColors.white1,
                          )
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: SliderTheme(
                            data: const SliderThemeData(
                              trackHeight: 2,
                              thumbShape: RoundSliderOverlayShape(overlayRadius: 10),
                              thumbColor: CustomColors.transparent,
                              overlayColor: CustomColors.transparent,
                              overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
                            ),
                            child: Slider(
                              value: progresScale, 
                              onChanged: (value) => updateProgresScaleManualy(value),
                              activeColor: CustomColors.white,
                            ), 
                          ),
                          
                        ),
                        const SizedBox(width: 10),
                        Text(
                          videoDurationInfo,
                          style: TextStyles.style23,
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => toggleMutation(),
                          child: Icon(
                            !isMuted
                            ? Icons.volume_up_rounded
                            : Icons.volume_off_rounded,
                            color: CustomColors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () => toggleView(),
                          child: Icon(
                            !isBig
                            ? Icons.fullscreen_rounded
                            : Icons.fullscreen_exit_rounded,
                            color: CustomColors.white,
                          ),
                        )
                      ],
                    ),
                  )
                )
                : const SizedBox(),
                widget.showTitle && !isPlaying && !isTabBarShown
                ? Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
                    child: GestureDetector(
                      onTap: () => toggleControllBar(),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(bottom: 5,left: 10),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0,0.7),
                            end: Alignment.center,
                            stops: [0,0.7],
                            colors: [
                              CustomColors.black,
                              CustomColors.transparent
                            ]
                          )
                        ),
                        child: Text(
                          widget.title ?? '',
                          style: TextStyles.style27,
                        ),
                      ),
                    ),
                  ),
                )
                : const SizedBox()
              ],
            ),
            !isPlaying
            ? Center(
              child: GestureDetector(
                onTap: () => toggleVideo(),
                child: SvgPicture.asset('assets/icons/play.svg')
              )
            )
            : const SizedBox()
          ],
        ),
      ),
    );
  }
}
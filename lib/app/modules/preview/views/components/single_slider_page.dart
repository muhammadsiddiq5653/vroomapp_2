import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:vroom_app/app/widgets/app_text/small_text.dart';

import '../../../../app_colors.dart';
import '../../../../widgets/app_text/big_header_text.dart';

class SingleSliderPage extends StatefulWidget {
  const SingleSliderPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Map<String, String> item;

  @override
  State<SingleSliderPage> createState() => _SingleSliderPageState();
}

class _SingleSliderPageState extends State<SingleSliderPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/sounds/1085376104.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }


  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: AppColors.primary,
    // );
    return Container(
      decoration: BoxDecoration(
          color: AppColors.background
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(27, 20, 27, 200),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 65.h,
                ),
                _controller.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
                    : Container(),
                SizedBox(
                  height: 20.h,
                ),
                BigHeaderText(
                  text: widget.item['title'] ?? '',
                  color: Colors.white,
                  fontSize: 20.sp,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15.h,
                ),
                SmallText(
                  text: widget.item['subtitle'] ?? '',
                  color: Colors.white,
                  textAlign: TextAlign.center,
                  fontSize: 14.sp,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class video_detalis extends StatefulWidget {
  const video_detalis({super.key});

  @override
  State<video_detalis> createState() => _video_detalisState();
}

class _video_detalisState extends State<video_detalis> {
  late ChewieController chewieController;
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.asset("lib/Video/1.3gp")
      ..initialize().then((value) => () {
            setState(() {});
          });
    chewieController =
        ChewieController(videoPlayerController: videoPlayerController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Chewie(
                controller: chewieController,
              ),
            )
          ],
        ),
      ),
    );
  }
}

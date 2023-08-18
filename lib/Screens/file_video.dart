import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../Utils/list.dart';

class file_video_detalis extends StatefulWidget {
  const file_video_detalis({super.key});

  @override
  State<file_video_detalis> createState() => _file_video_detalisState();
}

class _file_video_detalisState extends State<file_video_detalis> {
  late ChewieController chewieController;
  late VideoPlayerController videoPlayerController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.file(File(Global.pic!.path))
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
          mainAxisAlignment: MainAxisAlignment.center,
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

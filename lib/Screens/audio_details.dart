import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_boster/Utils/model.dart';

class audio_detail extends StatefulWidget {
  const audio_detail({super.key});

  @override
  State<audio_detail> createState() => _audio_detailState();
}

class _audio_detailState extends State<audio_detail> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  playAudio(String ad) {
    assetsAudioPlayer.open(
      Audio(ad),
    );
  }

  @override
  Widget build(BuildContext context) {
    model data = ModalRoute.of(context)!.settings.arguments as model;
    return Scaffold(
      appBar: AppBar(
        title: Text("Music"),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: assetsAudioPlayer.currentPosition,
        builder: (context, snapshot) => Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(
                      data.image,
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(bottom: 20, left: 40, right: 40, top: 0),
              padding: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    data.title,
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "${snapshot.data?.inHours} : "
                    "${snapshot.data?.inMinutes} : "
                    "${snapshot.data?.inSeconds}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(left: 40, right: 40),
              padding: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(),
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      assetsAudioPlayer.pause();
                    },
                    icon: Icon(Icons.pause),
                  ),
                  IconButton(
                    onPressed: () {
                      playAudio(data.audio);
                    },
                    icon: Icon(Icons.play_arrow),
                  ),
                  IconButton(
                    onPressed: () {
                      assetsAudioPlayer.stop();
                    },
                    icon: Icon(Icons.stop),
                  ),
                  IconButton(
                    onPressed: () async {
                      await assetsAudioPlayer.loopMode;
                    },
                    icon: Icon(Icons.loop),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_boster/Screens/Neubox.dart';
import 'package:media_boster/Utils/model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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

  bool fav = false;
  @override
  Widget build(BuildContext context) {
    model data = ModalRoute.of(context)!.settings.arguments as model;
    return Scaffold(
      body: StreamBuilder(
        stream: assetsAudioPlayer.currentPosition,
        builder: (context, snapshot) => SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: NeuBox(child: Icon(Icons.arrow_back))),
                    ),
                    Text('M U S I C'),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: NeuBox(child: Icon(Icons.menu)),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                NeuBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset('${data.image}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${data.title}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(height: 6),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  fav = !fav;
                                });
                              },
                              icon: Icon(
                                Icons.favorite,
                                size: 32,
                              ),
                              color: (fav == true) ? Colors.red : Colors.grey,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                        "${snapshot.data?.inMinutes} : ${snapshot.data?.inSeconds}"),
                    Icon(Icons.shuffle),
                    IconButton(
                      icon: Icon(Icons.repeat),
                      onPressed: () async {
                        await assetsAudioPlayer.loopMode;
                      },
                    ),
                    Text('4:22')
                  ],
                ),
                const SizedBox(height: 30),
                NeuBox(
                  child: LinearPercentIndicator(
                    lineHeight: 10,
                    percent: 0.25,
                    progressColor: Colors.black38,
                    barRadius: Radius.circular(25),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 80,
                  child: Row(
                    children: [
                      Expanded(
                        child: NeuBox(
                            child: Icon(
                          Icons.skip_previous,
                          size: 32,
                        )),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              playAudio(data.audio);
                            },
                            child: NeuBox(
                                child: Icon(
                              Icons.play_arrow,
                              size: 32,
                            )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: NeuBox(
                            child: Icon(
                          Icons.skip_next,
                          size: 32,
                        )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:media_boster/Screens/Neubox.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
//
// class SongPage extends StatefulWidget {
//   const SongPage({Key? key}) : super(key: key);
//
//   @override
//   State<SongPage> createState() => _SongPageState();
// }
//
// class _SongPageState extends State<SongPage> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[300],
//       body: StreamBuilder(
//         stream: assetsAudioPlayer.currentPosition,
//         builder: ,
//       )
//     );
//   }
// }

// Column(
// children: [
// Container(
// height: 400,
// width: double.infinity,
// margin: EdgeInsets.all(30),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(20),
// image: DecorationImage(
// image: AssetImage(
// data.image,
// ),
// fit: BoxFit.cover,
// )),
// ),
// Container(
// height: 60,
// margin: EdgeInsets.only(bottom: 20, left: 40, right: 40, top: 0),
// padding: EdgeInsets.all(8),
// width: double.infinity,
// decoration: BoxDecoration(
// border: Border.all(),
// color: Colors.blueGrey,
// borderRadius: BorderRadius.circular(20),
// ),
// child: Column(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: [
// Text(
// data.title,
// style: TextStyle(fontSize: 16),
// ),
// Text(
// "${snapshot.data?.inHours} : "
// "${snapshot.data?.inMinutes} : "
// "${snapshot.data?.inSeconds}",
// style: TextStyle(
// color: Colors.white,
// fontSize: 14,
// fontWeight: FontWeight.bold),
// ),
// ],
// ),
// ),
// Container(
// height: 60,
// margin: EdgeInsets.only(left: 40, right: 40),
// padding: EdgeInsets.all(8),
// width: double.infinity,
// decoration: BoxDecoration(
// border: Border.all(),
// color: Colors.blueGrey,
// borderRadius: BorderRadius.circular(20),
// ),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// IconButton(
// onPressed: () {
// assetsAudioPlayer.pause();
// },
// icon: Icon(Icons.pause),
// ),
// IconButton(
// onPressed: () {
// playAudio(data.audio);
// },
// icon: Icon(Icons.play_arrow),
// ),
// IconButton(
// onPressed: () {
// assetsAudioPlayer.stop();
// },
// icon: Icon(Icons.stop),
// ),
// IconButton(
// onPressed: () async {
// await assetsAudioPlayer.loopMode;
// },
// icon: Icon(Icons.loop),
// ),
// ],
// ),
// ),
// ],
// )

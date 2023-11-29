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

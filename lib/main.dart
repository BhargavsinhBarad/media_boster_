import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_boster/Screens/file_video.dart';
import 'package:media_boster/Screens/splash_screen.dart';
import 'package:media_boster/Screens/video_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Screens/audio_details.dart';
import 'Screens/home.dart';
import 'Screens/intro_page.dart';

void main() async {
  // SharedPreferences preferences = await SharedPreferences.getInstance();
  // bool isvisited = preferences.getBool("isIntroVisited") ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(useMaterial3: true),
      darkTheme: ThemeData.dark(),
      // initialRoute: (isvisited) ? 'splash' : '/',
      routes: {
        // '/': (ctx) => intro_page(),
        '/': (ctx) => Splash(),
        'home': (ctx) => home(),
        'audio_details': (ctx) => audio_detail(),
        'video_details': (ctx) => video_detalis(),
        'file_video_detalis': (ctx) => file_video_detalis()
      },
    ),
  );
}

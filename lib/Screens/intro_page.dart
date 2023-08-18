import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class intro_page extends StatefulWidget {
  const intro_page({super.key});

  @override
  State<intro_page> createState() => _intro_pageState();
}

class _intro_pageState extends State<intro_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Welcome to Bx Player",
            image: Center(
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("lib/Image/8.jpg"),
                        fit: BoxFit.cover)),
              ),
            ),
          ),
          PageViewModel(
            title: "Welcome to Bx Player",
            image: Center(
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("lib/Image/11.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          PageViewModel(
            title: "Welcome to Bx Player",
            image: Center(
              child: Container(
                height: 500,
                width: 500,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("lib/Image/12.jpg"),
                    )),
              ),
            ),
          ),
        ],
        done: Text("done"),
        onDone: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setBool("isIntroVisited", true);
          Navigator.pushReplacementNamed(context, 'splash');
        },
        next: Text("Next"),
        showNextButton: true,
      ),
    );
  }
}

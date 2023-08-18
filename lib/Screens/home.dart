import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/list.dart';
import '../Utils/model.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  CarouselController carouselController = CarouselController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final XFile? image =
              await Global.picker.pickVideo(source: ImageSource.gallery);
          setState(() {
            Global.pic = image;
            Navigator.pushNamed(context, 'file_video_detalis');
          });
        },
        child: Icon(Icons.photo_camera_back_rounded),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              " New Songs",
              style: TextStyle(fontSize: 20),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                viewportFraction: 0.7,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(seconds: 2),
                disableCenter: true,
              ),
              carouselController: carouselController,
              items: [
                ...audio
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          model m1 = model(
                            audio: e['audio'],
                            image: e['image'],
                            title: e['title'],
                          );
                          Navigator.pushNamed(context, 'audio_details',
                              arguments: m1);
                        },
                        child: Container(
                          margin: EdgeInsets.all(20),
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(e['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
            Text(
              " New Video",
              style: TextStyle(fontSize: 20),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(seconds: 2),
                disableCenter: true,
              ),
              carouselController: carouselController,
              items: [
                ...video
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          vmodel m1 = vmodel(
                            video: e['video'],
                            image: e['image'],
                          );
                          Navigator.pushNamed(context, 'audio_details',
                              arguments: m1);
                        },
                        child: Container(
                          margin: EdgeInsets.all(20),
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: AssetImage(e['image']),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
            Text(
              "All Songs",
              style: TextStyle(fontSize: 20),
            ),
            Column(
              children: audio
                  .map(
                    (e) => GestureDetector(
                      onTap: () {
                        model m1 = model(
                          audio: e['audio'],
                          image: e['image'],
                          title: e['title'],
                        );

                        Navigator.pushNamed(context, 'audio_details',
                            arguments: m1);
                      },
                      child: Container(
                        height: 120,
                        width: double.infinity,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: AssetImage(
                                      e['image'],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              e['title'],
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

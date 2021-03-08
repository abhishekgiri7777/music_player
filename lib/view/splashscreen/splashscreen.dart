import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/view/Dashboard/dashboard.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: slider(),
      ),
    );
  }
}

Widget slider() {
  return Container(
      child: PageView(
    children: [
      splashImage(),
      splashImage(),
      splashlast(),
    ],
  ));
}

// ignore: non_constant_identifier_names
Widget splashImage() {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage('assets/splash.jpg'),
    )),
    child: Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Center(
              child: Text(
                "splash screen",
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 180.0),
            child: Row(
              children: [
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => Dashboard());
                  },
                  child: Text("Skip"),
                ),
                SizedBox(
                  width: 150,
                ),
                ElevatedButton(
                  child: Text("Next"),
                  onPressed: () {
                    Get.to(() => Dashboard());
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget splashlast() {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage('assets/splash.jpg'),
    )),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 180.0),
          child: Center(
            child: Text(
              "last screen",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 180.0),
            child: Center(
              child: ElevatedButton(
                child: Text("Next"),
                onPressed: () {
                  Get.to(() => Dashboard());
                },
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

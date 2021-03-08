import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'videoplayerwidget.dart';

class VideoPlayerPage extends StatefulWidget {
  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController controller;

  //here decleare location of video from where we play.
  final assets = 'assets/flutter.mp4';

  @override
  void initState() {
    super.initState();

    //Here You can initialize form where you play video asset, file
    // or from network
    controller = VideoPlayerController.asset(assets)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller.play());
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

// ignore: missing_return
  @override
  Widget build(BuildContext context) {
    final videoSound = controller.value.volume == 0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Video Player"),
          ),
        ),
        body: Column(
          children: [
            VideoPlayerWidget(controller: controller),
            const SizedBox(height: 32),
            if(controller != null && controller.value.initialized)
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red,
              child: IconButton(
                icon: Icon(
                  videoSound ? Icons.volume_mute : Icons.volume_up,
                ),
                onPressed: ()=> 
                controller.setVolume(
                  videoSound ? 1 : 0 
                  ),
                ),
            ),            
          ],
        ),
      ),
    );
  }
}

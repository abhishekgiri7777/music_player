import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerPage extends StatefulWidget {
  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  bool playpause = true;

  void pauseplay() {
    setState(() {
      playpause = !playpause;
    });
  }

  AudioPlayer _player;
  AudioCache cache;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  Widget slider() {
    return Container(
      width: 320.0,
      child: Slider.adaptive(
          activeColor: Colors.blue[800],
          inactiveColor: Colors.grey[350],
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value) {
            seekTosec(value.toInt());
          }),
    );
  }

  void seekTosec(int sec) {
    Duration newPos = Duration(seconds: sec);
    _player.seek(newPos);
  }

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    cache = AudioCache(fixedPlayer: _player);

    // ignore: deprecated_member_use
    _player.durationHandler = (d) {
      setState(() {
        musicLength = d;
      });
    };

    // ignore: deprecated_member_use
    _player.positionHandler = (p) {
      setState(() {
        position = p;
      });
    };
  }

  var index = 0;
  var songList = [
    'assets/song.mp3',
    'assets/dil_tod_ke.mp3',
    'assets/dil_tukde_tukde.mp3',
    'assets/husnn_hai_suhaana.mp3',
    'assets/mirchi_lagi_toh.mp3',
    'assets/tere_siva.mp3',
  ].toList();

  String previoussong() {
    var so;
    if (index != 0) {
      index--;
    } else {
      index = 0;
    }
    so = cache.play(songList[index]);
    return so;
  }

  Future<AudioPlayer> currentsong() {
    print(songList[index]);
    return cache.play(songList[index]);
  }

  String nextsong() {
    var so;
    if (index != songList.length) {
      index++;
    } else {
      index = 0;
    }
    so = cache.play(songList[index]);
    return so;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      appBar: AppBar(
        title: Center(child: Text("Music Player")),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () => print('Notification button Pressed')),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade100, Colors.blue[200]])),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 110.0),
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.center,
                        image: AssetImage('assets/songpic.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 60.0),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.indigo,
                          Colors.black12,
                          Colors.indigo,
                        ]),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    )),
                child: Container(
                  margin: EdgeInsets.only(top: 60.0),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                                "${position.inMinutes}: ${position.inSeconds.remainder(60)}"),
                            slider(),
                            Text(
                                "${musicLength.inMinutes}: ${musicLength.inSeconds.remainder(60)}"),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                previoussong();
                                print("Previous Button pressed");
                              },
                              icon: Icon(
                                Icons.skip_previous,
                                size: 45.0,
                              ),
                            ),

                            /*Play Pause Button*/
                            IconButton(
                              onPressed: () {
                                pauseplay();
                                if (!playpause) {
                                  cache.play("dil_tod_ke.mp3");
                                  // currentsong();
                                } else {
                                  _player.pause();
                                }
                              },
                              icon: Icon(
                                playpause ? Icons.play_arrow : Icons.pause,
                                size: 45.0,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                nextsong();
                                print("Next Button pressed");
                                print("${songList[index].toString()}");
                              },
                              icon: Icon(
                                Icons.skip_next,
                                size: 45.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: unused_element
Widget _backgroundimage() {
  return InkWell(
    onTap: () {
      print("Top Card clicked");
    },
    child: Column(
      children: [
        Container(
          height: 180,
          width: 450,
          decoration: BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.center,
                  image: AssetImage('assets/01_splash.jpg'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 250.0),
                child: Text(
                  "Discriptions",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, right: 250.0),
                child: Text(
                  "Song discription",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 65, left: 250),
                child: MaterialButton(
                  shape: StadiumBorder(),
                  color: Colors.pink[600],
                  onPressed: () => print("Subscribe"),
                  child: Text(
                    "Subscribe",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

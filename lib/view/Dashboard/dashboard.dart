import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/view/audio/audioplayer.dart';
import 'package:music_player/view/video/videoplayer.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      drawer: Drawer(),
      appBar: AppBar(
        title: Container(
          margin: EdgeInsets.only(left: 40.0),
          child: Center(
            child: Text("Vibrant Life"),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () => print('Notification button Pressed')),
          IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () => print('Person icon Pressed')),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            searchfield(),
            _audiocard(),
            SizedBox(
              height: 10.0,
            ),
            _videocard(),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Made For You",
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  Text(
                    "View more",
                    style: TextStyle(fontSize: 20.0, color: Colors.brown),
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

Widget searchfield() {
  TextEditingController searchtext = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  return Padding(
    padding:
        const EdgeInsets.only(top: 8.0, bottom: 1.0, left: 8.0, right: 8.0),
    child: Form(
        key: _formkey,
        child: TextFormField(
          keyboardType: TextInputType.text,
          controller: searchtext,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5.0),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.search,
              ),
              color: Colors.green,
              onPressed: () {},
            ),
            labelText: "Search",
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          ),
        )),
  );
}

Widget _audiocard() {
  return InkWell(
    onTap: () {
      Get.to(() => AudioPlayerPage());
      print("Audio Playing...");
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
                  onPressed: () {
                    Get.to(() => AudioPlayerPage());
                    print("Audio Playing...");
                  },
                  child: Text(
                    "Play Audio",
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

Widget _videocard() {
  return InkWell(
    onTap: () {
      Get.to(() => VideoPlayerPage());
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
                  image: AssetImage('assets/videopic.jpeg'),
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
                  onPressed: () => print("Video Playing..."),
                  child: Text(
                    "Play Video",
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

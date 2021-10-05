import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AudioCache audioCache = AudioCache();
  List<String> nameList = [];
  List<Color> colorList = [];
  List<String> audioName = [];
  double left = 10;
  double right = 10;

  @override
  void initState() {
    nameList = ['DO', 'RE', 'MI', 'FA', 'SOL', 'LA', 'SI'];
    colorList = [
      Colors.red,
      Colors.yellow,
      Colors.green,
      Colors.pink,
      Colors.purple,
      Colors.orange,
      Colors.blue
    ];
    audioName = [
      'audios/noteDO.wav',
      'audios/noteRE.wav',
      'audios/noteMI.wav',
      'audios/noteFA.wav',
      'audios/noteSOL.wav',
      'audios/noteLA.wav',
      'audios/noteSI.wav'
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Music",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Listen to music together!"),
          backgroundColor: Colors.teal[300],
        ),
        body: Center(
          child: Column(
            children: [
              for (int i = 0; i < 7; i++)
                Expanded(
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: Container(
                      margin:
                          EdgeInsets.fromLTRB(left += 10, 0, right += 10, 10),
                      child: ElevatedButton(
                        child: Text(nameList[i]),
                        onPressed: () {
                          if (nameList[i] == 'DO') {
                            audioCache.play(audioName[0]);
                          } else if (nameList[i] == 'RE') {
                            audioCache.play(audioName[1]);
                          } else if (nameList[i] == 'MI') {
                            audioCache.play(audioName[2]);
                          } else if (nameList[i] == 'FA') {
                            audioCache.play(audioName[3]);
                          } else if (nameList[i] == 'SOL') {
                            audioCache.play(audioName[4]);
                          } else if (nameList[i] == 'LA') {
                            audioCache.play(audioName[5]);
                          } else if (nameList[i] == 'SI') {
                            audioCache.play(audioName[6]);
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: colorList[i],
                          maximumSize: Size(100, 100),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:booster_app/controller/audio_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final MyAudioController myAudioController = MyAudioController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: StreamBuilder(
        stream: myAudioController.audioPlayer.currentPosition,
        builder: (context, snapShot) {
          double mex = myAudioController.duration.inSeconds.toDouble();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                maxRadius: 100,
                foregroundColor: Colors.red,
              ),
              Slider(
                min: 0,
                max: mex,
                value: snapShot.data?.inSeconds.toDouble() ?? 0,
                onChanged: (val) {
                  myAudioController.seek(second: val.toInt());
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      myAudioController.play();
                    },
                    icon: const Icon(
                      CupertinoIcons.play,
                    ),
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

import 'package:booster_app/controller/audio_controller.dart';
import 'package:booster_app/modals/api_modals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Media media = ModalRoute.of(context)!.settings.arguments as Media;
    MyAudioController my = Get.put(MyAudioController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Page'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 319,
                width: 304,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(media
                          .snippet.value.thumbnails.value.high.value.url.value),
                      fit: BoxFit.fill),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(36),
                  ),
                ),
              ),
              Text(
                media.snippet.value.title.value,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Slider(
                thumbColor: const Color.fromRGBO(97, 87, 226, 1),
                activeColor: const Color.fromRGBO(97, 87, 226, 1),
                inactiveColor: const Color.fromRGBO(242, 242, 242, 1),
                min: 0,
                max: 100,
                value: 50,
                onChanged: (val) {
                  my.seek(second: val.toInt());
                },
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '25:50',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(242, 242, 242, 1)),
                  ),
                  Text(
                    '50:30',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(242, 242, 242, 1)),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      MyAudioController my = MyAudioController();
                    },
                    child: Container(
                      height: 24,
                      width: 24,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/assets/pre.png'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    height: 74,
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromRGBO(97, 87, 226, 1),
                    ),
                    child: IconButton(
                      onPressed: () {
                        MyAudioController my = MyAudioController();
                        my.play();
                      },
                      icon: const Icon(Icons.pause_sharp),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    height: 24,
                    width: 24,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/next.png'),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

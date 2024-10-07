import 'package:booster_app/controller/api_controller.dart';
import 'package:booster_app/modals/api_modals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomePage1 extends StatelessWidget {
  HomePage1({super.key});
  final mediyaController controller = Get.put(
    mediyaController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://t4.ftcdn.net/jpg/01/06/47/61/360_F_106476142_zMZkkTkhMeq0DIjV20oJI00e3QXLYIGN.jpg"),
        ),
        title: const Text('Home Page'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none_outlined,
              size: 33,
            ),
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Listen The \nLatest Musics',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    icon: Icon(
                      Icons.search_rounded,
                      size: 30,
                    ),
                    hintText: 'Search Music',
                    hintStyle: TextStyle(fontSize: 14),
                  ),
                  textInputAction: TextInputAction.done,
                  controller: controller.searchController,
                  onSubmitted: (value) {
                    controller.getSonge(search: value);
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Recommend for you',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Obx(() {
            return SizedBox(
              height: 500,
              child: ListView.builder(
                itemCount: controller.allMediya.length,
                itemBuilder: (context, index) {
                  Media media = controller.allMediya[index];
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        '/music_page',
                        arguments: media,
                      );
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(
                          media.snippet.value.title.value,
                          maxLines: 2,
                        ),
                        contentPadding: const EdgeInsets.all(10),
                        leadingAndTrailingTextStyle:
                            const TextStyle(fontSize: 50),
                        leading: SizedBox(
                          height: 70,
                          width: 70,
                          child: CircleAvatar(
                            foregroundImage: NetworkImage(media.snippet.value
                                .thumbnails.value.high.value.url.value),
                            radius: 30,
                          ),
                        ),
                      ),
                    ),
                  );
                  // return ListTile(
                  //   contentPadding: EdgeInsets.all(10),
                  //   leadingAndTrailingTextStyle: TextStyle(fontSize: 50),
                  //   leading: CircleAvatar(
                  //     foregroundImage: NetworkImage(media
                  //         .snippet.value.thumbnails.value.high.value.url.value),
                  //     radius: 30,
                  //     backgroundColor: Colors.blue,
                  //   ),
                  //   title: Text('data'),
                  // );
                },
              ),
            );
          })
        ],
      ),
    );
  }
}

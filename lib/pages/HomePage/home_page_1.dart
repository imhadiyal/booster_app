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
        leading: const CircleAvatar(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed('/music_page');
        },
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
            height: 30,
          ),
          const Text(
            "Recently Played",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemBuilder: (c, i) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 100,
                      width: 100,
                      color: Colors.blue,
                    ),
                    Text('data')
                  ],
                );
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          const Text(
            'Recommend for you',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Obx(() {
            return SizedBox(
              height: 200,
              child: GridView.builder(
                itemCount: controller.allMediya.length,
                itemBuilder: (context, index) {
                  Media media = controller.allMediya[index];
                  return ListTile(
                    contentPadding: EdgeInsets.all(10),
                    horizontalTitleGap: 20,
                    leadingAndTrailingTextStyle: TextStyle(fontSize: 50),
                    leading: CircleAvatar(
                      foregroundImage: NetworkImage(media
                          .snippet.value.thumbnails.value.high.value.url.value),
                      radius: 30,
                      backgroundColor: Colors.blue,
                    ),
                    title: Text('data'),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
              ),
            );
          })
        ],
      ),
    );
  }
}

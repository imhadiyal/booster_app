import 'package:booster_app/pages/HomePage/home_page_1.dart';
import 'package:booster_app/pages/MusicPage/music_page.dart';
import 'package:get/get.dart';

class Routes {
  Routes._();
  static final Routes routes = Routes._();

  List<GetPage> get_pages = <GetPage>[
    GetPage(
      name: '/',
      page: () => HomePage1(),
    ),
    GetPage(
      name: '/music_page',
      page: () => const MusicPage(),
    ),
  ];
}

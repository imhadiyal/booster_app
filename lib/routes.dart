import 'package:booster_app/HomePage/home_page.dart';
import 'package:get/get.dart';

class Routes {
  Routes._();
  static final Routes routes = Routes._();

  List<GetPage> get_pages = <GetPage>[
    GetPage(
      name: '/',
      page: () => HomePage(),
    ),
  ];
}

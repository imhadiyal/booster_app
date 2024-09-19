import 'package:booster_app/helper/api_helper.dart';
import 'package:booster_app/modals/api_modals.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class mediyaController {
  mediyaController() {
    getSonge();
  }
  RxList allMediya = [].obs;
  RxBool loading = false.obs;
  TextEditingController searchController = TextEditingController();
  Future<void> getSonge({String search = "hit song"}) async {
    loading = true.obs;
    List<Media> data = await ApiHelper.apiHelper.initData(query: search);
    allMediya = data.obs;
    loading = false.obs;
  }
}

import 'dart:convert';

import 'package:booster_app/modals/api_modals.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiHelper {
  ApiHelper._();
  static final ApiHelper apiHelper = ApiHelper._();
  final String baseUrl = 'https://www.googleapis.com/youtube/v3/';
  final String key = 'AIzaSyCO2jsmh8SXhjCy8ssecJr8lpFP9LlPbvM';

  Future<List<Media>> initData({required String query}) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            '$baseUrl?part=snippet&maxResults=50&q=$query&type=song&key=$key'),
      );
      Logger().i(response.statusCode);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List list = data['items'];
        return list.map((e) => Media.fromJson(e ?? {})).toList();
      } else {
        throw Exception(
            'Failed to load videos. Status code: ${response.statusCode}');
      }
    } catch (e) {
      Logger().e('Error fetching videos: $e');
      return [];
    }
  }
}

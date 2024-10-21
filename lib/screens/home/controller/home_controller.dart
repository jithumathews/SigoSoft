import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sigosoft_test/screens/home/model/home_model.dart';

class HomeController extends GetxController {
  var baseUrl = "https://ourworks.co.in/sigofish-backend/public/customer/".obs;
  var homeDcreenData = "home?latitude=8.111&longitude=9.111&limit=10".obs;
  var token = "208|PSdgfNi58S1qupatJAGm8xzZYcY5zqjvVypQ6BKx".obs;
  var index = 0.obs;

  Rx<HomeModel> homeModel = HomeModel().obs;

  void setIndex(int value) {
    index.value = value;
    log(index.value.toString());
  }

  @override
  void onInit() {
    super.onInit();
    getHomeDataFunc();
  }

  Future<void> getHomeDataFunc() async {
    try {
      final Uri uri = Uri.parse("$baseUrl$homeDcreenData");

      final request = await http.get(
        uri,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      log(uri.toString());
      log(request.body.toString());

      if (request.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(request.body);
        homeModel.value = HomeModel.fromJson(responseData);
        log(responseData.toString());
      } else {
        log("Error: ${request.statusCode}");
      }
    } catch (e) {
      log("Exception: $e");
    }
  }
}

import 'dart:convert';

import 'package:dotpay/helperMethods/http_helper.dart';

import '../models/user.dart';

class KYCHelper {
  static register(
      String email, String password, String name, String phone) async {
    String url = "https://rubix.agarwalviraj.in/api/user/register";
    var res = await HttpHelper.postRequest(url, {}, {
      "email": email,
      "password": password,
      "name": name,
      "pin": "123456",
      "phone": phone
    });
    final resp = res.body;
    final data = jsonDecode(resp);

    if (data["success"] == true) {
      User user = User.fromMap(data['user']);
    }
  }

  static login(String email, String password) async {
    String url = "https://rubix.agarwalviraj.in/api/user/login";
    final res = await HttpHelper.postRequest(
        url, {}, {"email": email, "password": password});
    final resp = res.body;
    final data = jsonDecode(resp);

    if (data["success"] == true) {
      String key = data['key'];
    }
  }

  static getUserDetails(String token) async {
    String url = "https://rubix.agarwalviraj.in/api/user/get-details";
    final res = await HttpHelper.getRequest(
        url: url, headers: {"Authorization": "Bearer $token"});
    final resp = res.body;
    final data = jsonDecode(resp);

    if (data["success"] == true) {
      User user = User.fromMap(data['user']);
    }
  }
}

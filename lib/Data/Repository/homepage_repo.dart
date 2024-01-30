import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../API/api.dart';
import '../Models/homepage_model.dart';

abstract class HomePageRepository {
  Future<HomePageModel> fetchDetails(String firstname, String lastName,
      String email, String mobile, String password);
}

class HomePageRepo extends HomePageRepository {
  @override
  Future<HomePageModel> fetchDetails(String firstname, String lastName,
      String email, String mobile, String password) async {
    final response = await http.post(
        Uri.parse('https://'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "mobile": mobile,
          "email": email,
          "password": password,
          "firstName": firstname,
          "lastName": lastName,
        }));
    print(response.statusCode);

    if (response.statusCode == 201) {
      return HomePageModel.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      print(response.body);
    } else {
      debugPrint("ERROR IN API CALL ${response.statusCode}");
      throw Exception('Failed to load API data');
    }
  }
}

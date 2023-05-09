import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Services {
  /* Log In */
  Future<bool> login(String email, String password) async {
    bool success = false;
    Map<String, String> header = {
      'Content-type': 'application/json ',
      'Accept': 'application/json',
    };
    Map data = {"email": email, "password": password};
    var url = Uri.parse("https://localhost:7237/api/User_/loginUser");

    try {
      final response = await http
          .post(
            url,
            body: jsonEncode(data),
            headers: header,
          )
          .timeout(const Duration(
              seconds:
                  20)); //converts data to json format and used for the Get/Post/Delete
      if (response.statusCode == 200) {
        Map<String, dynamic> output = json.decode(response.body);

        success = true;
      } else if (response.statusCode == 400) {
        print(response.body);
        success = false;
      } else {
        success = false;
      }
    } catch (e) {
      success = false;
    }

    return success;
  }

  /* Registring a user */
  Future<bool> signUp(
    String name,
    String surName,
    String email,
    String password,
  ) async {
    bool success = false;
    const Map<String, String> header = {
      'Content-type': 'application/json ',
      'Accept': 'application/json',
    };
    Map data = {
      "name": name,
      "surname": surName,
      "email": email,
      "password": password,
    };

    var url = Uri.parse("https://localhost:7237/api/User_/registerUser");

    try {
      var response = await http
          .post(url, body: jsonEncode(data), headers: header)
          .timeout(const Duration(seconds: 20));
      if (response.statusCode == 200) {
        print("${response.statusCode} : ${response.body}");
        success = true;
      } else {
        print("${response.statusCode} : ${response.body}");
        success = false;
      }
    } catch (e) {
      success = false;
    }

    return success;
  }

  /* Getting all the entries */
}

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'model/login_response.dart';

class NetworkHelper{

  Future<int> login(String email, String password, SharedPreferences prefs) async{
    int statusCode = 0;
    final response = await http.post(
      Uri.parse('https://stage.ttl.ciot.my/api/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email, 'password': password}),
    );

    statusCode = response.statusCode;

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var myLoginResponse = LoginResponse.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
      prefs.setString("access_token", myLoginResponse.data.accessToken);
      prefs.setString("user_name", myLoginResponse.data.user.name);
      prefs.setString("user_email", myLoginResponse.data.user.email);
      prefs.setString("user_type", myLoginResponse.data.user.userType);

      log("accessToken: ${myLoginResponse.data.accessToken}");
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to login.');
    }

    return statusCode;
  }

  Future<int> getSwo(String accessToken) async{
    int statusCode = 0;
    final response = await http.get(
      Uri.parse('https://stage.ttl.ciot.my/api/swo'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $accessToken'   // Send authorization headers to the backend.
      },

    );

    statusCode = response.statusCode;

    if (response.statusCode == 200) {
      // Process the json individually, since the json response is complex
      var jsonResponse = jsonDecode(response.body);
      for(var jsonObj in jsonResponse['data']){
        log("swo_no: ${jsonObj['swo_no']}");
      }
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      log("statusCode: $statusCode");
    }

    return statusCode;
  }

}
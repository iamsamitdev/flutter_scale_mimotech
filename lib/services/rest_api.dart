// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'package:flutter_scale/utils/constants.dart';
import 'package:flutter_scale/utils/utility.dart';
import 'package:http/http.dart' as http;

class CallAPI {

  // Set Header
  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };

  // Login API Method
  loginAPI(data) async {
    // check network connection
    if(await Utility.checkNetwork() == ''){
      return http.Response(
        jsonEncode({
          'status': 'error',
          'message': 'No Internet Connection!'
        }),
        200
      );
    } else {
      return await http.post(
        Uri.parse(baseURLAPI + 'login'),
        body: jsonEncode(data),
        headers: _setHeaders(),
      );
    }
  }

}
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:visa_officer_insider_secrets/Utils/constant.dart';

class BaseService extends GetConnect {
  hitLogin(String email) async {
    try {
      var response = await GetConnect()
          .get(
            "${BASE_URL}visa_user_check_api.cfm?email=${email}",
          )
          .timeout(const Duration(seconds: 40));
      print(response.statusText);
      var parseData = response.body;
      print(parseData);
      return parseData;
    } on SocketException {
      throw Exception('Internet Connection');
    }
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'model/AirLineDataModel.dart';

class AirLineApi {
  final Client _httpClient = Client();

  final String _apiUrl =
      "https://www.kayak.com/h/mobileapis/directory/airlines";

  Future<List<AirLineDataModel>> listAirLines() async {
    final response = await _httpClient.get(_apiUrl);
    return compute(_parse, response.body);
  }
}

//region Helpers

List<AirLineDataModel> _parse(String responseBody) {
  return jsonDecode(responseBody)
      .cast<Map<String, dynamic>>()
      .map<AirLineDataModel>((json) => AirLineDataModel(
            site: json['site'] as String,
            defaultName: json['defaultName'] as String,
            logoURLWithoutBaseUrl: json['logoURL'] as String,
            phone: json['phone'] as String,
            usName: json['usName'] as String,
            name: json['name'] as String,
            code: json['code'] as String,
          ))
      .toList();
}

//endregion

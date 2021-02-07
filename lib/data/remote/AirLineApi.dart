import 'dart:convert';
import 'package:demo_mvvm_with_flutter/data/AirLineModel.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class AirLineApi {
  final Client _httpClient = Client();

  final String _apiUrl =
      "https://www.kayak.com/h/mobileapis/directory/airlines";

  Future<List<AirLineModel>> listAirLines() async {
    final response = await _httpClient.get(_apiUrl);
    return compute(_parse, response.body);
  }
}

//region Helpers

List<AirLineModel> _parse(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<AirLineModel>((json) => _fromJson(json))
      .toList();
}

AirLineModel _fromJson(Map<String, dynamic> json) {
  return AirLineModel(
    site: json['site'] as String,
    defaultName: json['defaultName'] as String,
    logoURLWithoutBaseUrl: json['logoURL'] as String,
    phone: json['phone'] as String,
    usName: json['usName'] as String,
    name: json['name'] as String,
    code: json['code'] as String,
  );
}

//endregion

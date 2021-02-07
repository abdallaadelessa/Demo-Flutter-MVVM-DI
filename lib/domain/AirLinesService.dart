import 'package:demo_mvvm_with_flutter/data/AirLineModel.dart';
import 'package:demo_mvvm_with_flutter/data/remote/AirLineApi.dart';

class AirLinesSevice {
  final AirLineApi airLineApi;

  AirLinesSevice({this.airLineApi});

  Future<List<AirLineModel>> listAirLines() => airLineApi.listAirLines();
}

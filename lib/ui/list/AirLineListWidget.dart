import 'package:demo_mvvm_with_flutter/data/AirLineModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'AirLineListTileWidget.dart';

class AirLineListWidget extends StatelessWidget {
  final List<AirLineModel> airLines;

  AirLineListWidget({Key key, this.airLines}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: airLines.length,
      itemBuilder: (context, index) =>
          AirLineListTileWidget(airLine: airLines[index]),
    );
  }
}

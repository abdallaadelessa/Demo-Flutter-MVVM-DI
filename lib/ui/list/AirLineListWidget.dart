import 'package:demo_mvvm_with_flutter/domain/airline/model/AirLineDomainModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'AirLineListTileWidget.dart';

class AirLineListWidget extends StatelessWidget {
  final List<AirLineDomainModel> airLines;

  final Function(AirLineDomainModel model) toggleFavouriteState;

  AirLineListWidget({Key key, this.airLines, this.toggleFavouriteState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: airLines.length,
      itemBuilder: (context, index) => AirLineListTileWidget(
          airLine: airLines[index], toggleFavouriteState: toggleFavouriteState),
    );
  }
}

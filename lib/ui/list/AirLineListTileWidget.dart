import 'package:demo_mvvm_with_flutter/data/AirLineModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AirLineListTileWidget extends StatelessWidget {
  final AirLineModel airLine;

  AirLineListTileWidget({Key key, this.airLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        airLine.name,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        airLine.site,
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
      ),
      leading: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 44,
          minHeight: 44,
          maxWidth: 44,
          maxHeight: 44,
        ),
        child: Image.network(airLine.imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}

import 'package:demo_mvvm_with_flutter/domain/airline/model/AirLineDomainModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AirLineListTileWidget extends StatelessWidget {
  final AirLineDomainModel airLine;

  Color get _favouriteColor {
    if (airLine.isFavourite) {
      return Colors.orange;
    } else {
      return Colors.black;
    }
  }

  final Function(AirLineDomainModel model) toggleFavouriteState;

  AirLineListTileWidget({Key key, this.airLine, this.toggleFavouriteState})
      : super(key: key);

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
      trailing: IconButton(
        icon: Icon(Icons.android),
        color: _favouriteColor,
        onPressed: () => toggleFavouriteState(airLine),
      ),
    );
  }
}

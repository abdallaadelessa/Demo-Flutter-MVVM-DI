import 'dart:collection';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'model/AirLineDomainModel.dart';

class FavouritesService {
  static const String KEY_PREFS = "favourites";

  final Set<AirLineDomainModel> _favourites = new HashSet();

  //region Public Methods

  Future<bool> toggle(AirLineDomainModel model) async {
    if (model.isFavourite) {
      _remove(model);
    } else {
      _add(model);
    }
    return await _write();
  }

  Future<List<AirLineDomainModel>> list() async {
    if (_favourites.isEmpty) {
      await _read();
    }
    return new List<AirLineDomainModel>.from(_favourites);
  }

  //endregion

  //region Operations

  Future<bool> _add(AirLineDomainModel model) async {
    _favourites.add(model);
    return await _write();
  }

  Future<bool> _remove(AirLineDomainModel model) async {
    _favourites.remove(model);
    return await _write();
  }

  //endregion

  //region Helpers

  Future<bool> _write() async {
    try {
      var instance = await SharedPreferences.getInstance();
      await instance.setString(KEY_PREFS, jsonEncode(_favourites.toList()));
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> _read() async {
    try {
      var instance = await SharedPreferences.getInstance();
      _favourites.clear();
      var json = instance.getString(KEY_PREFS);
      var data = jsonDecode(json)
          .cast<Map<String, dynamic>>()
          .map<AirLineDomainModel>((json) =>AirLineDomainModel.fromJson(json))
          .toList();
      _favourites.addAll(data);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

//endregion

}

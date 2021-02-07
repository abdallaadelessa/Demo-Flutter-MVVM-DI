import 'package:demo_mvvm_with_flutter/domain/airline/AirLinesService.dart';
import 'package:demo_mvvm_with_flutter/domain/airline/FavouritesService.dart';
import 'package:demo_mvvm_with_flutter/domain/airline/model/AirLineDomainModel.dart';
import 'package:demo_mvvm_with_flutter/ui/common/vmstate/VMState.dart';
import 'package:flutter/widgets.dart';

class AirLineListPageVM extends ChangeNotifier {
  final AirLinesService airLineService;
  final FavouritesService favouritesService;

  List<AirLineDomainModel> _lastFetchedData;

  VMState state = VMLoadingState();

  AirLineListPageVM({this.airLineService, this.favouritesService}) {
    fetchData(true);
  }

  Future<void> fetchData(bool showLoading) async {
    try {
      if (showLoading) {
        state = VMLoadingState();
        notifyListeners();
      }
      _lastFetchedData = await airLineService.listAirLines();
      state = VMContentState(_lastFetchedData);
    } catch (e) {
      state = VMErrorState(e.toString());
    }
    notifyListeners();
  }

  toggleFavouriteState(AirLineDomainModel model) async {
    var result = await favouritesService.toggle(model);
    if (result) {
      model.isFavourite = !model.isFavourite;
      notifyListeners();
    }
  }
}

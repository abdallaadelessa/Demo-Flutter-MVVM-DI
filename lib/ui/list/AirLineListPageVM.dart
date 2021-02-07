import 'package:demo_mvvm_with_flutter/domain/AirLinesService.dart';
import 'package:demo_mvvm_with_flutter/ui/common/vmstate/VMState.dart';
import 'package:flutter/widgets.dart';

class AirLineListPageVM extends ChangeNotifier {
  final AirLinesSevice airLineService;

  VMState state = VMLoadingState();

  AirLineListPageVM({this.airLineService}) {
    fetchData(true);
  }

  Future<void> fetchData(bool showLoading) async {
    try {
      if (showLoading) {
        state = VMLoadingState();
        notifyListeners();
      }
      var data = await airLineService.listAirLines();
      state = VMSuccessState(data);
    } catch (e) {
      state = VMErrorState(e.toString());
    }
    notifyListeners();
  }
}

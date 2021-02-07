import 'package:demo_mvvm_with_flutter/di/Injector.dart';
import 'package:demo_mvvm_with_flutter/ui/common/ErrorPlaceHolder.dart';
import 'package:demo_mvvm_with_flutter/ui/common/LoadingSpinner.dart';
import 'package:demo_mvvm_with_flutter/ui/common/vmstate/VMState.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:provider/provider.dart';

import 'AirLineListPageVM.dart';
import 'AirLineListWidget.dart';

class AirLineListPage extends StatefulWidget {
  final String title;

  AirLineListPage({Key key, this.title}) : super(key: key);

  @override
  _AirLineListPageState createState() => _AirLineListPageState();
}

class _AirLineListPageState extends State<AirLineListPage> {
  AirLineListPageVM _vm;

  @override
  void initState() {
    super.initState();
    getInjector().configure();
    _vm = KiwiContainer().resolve<AirLineListPageVM>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Container(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: ChangeNotifierProvider(
                  create: (context) => _vm,
                  child: _getContent(context),
                ))));
  }

  Widget _getContent(BuildContext context) {
    return Consumer<AirLineListPageVM>(
      builder: (context, vm, child) {
        if (vm.state is VMErrorState) {
          return ErrorPlaceHolder(
              errorMessage: (vm.state as VMErrorState).msg,
              retryAction: () => vm.fetchData(true));
        } else if (vm.state is VMLoadingState) {
          return LoadingSpinner();
        } else {
          return RefreshIndicator(
              child: AirLineListWidget(
                  airLines: (vm.state as VMContentState).value,
                  toggleFavouriteState: (model) async =>
                      await _vm.toggleFavouriteState(model)),
              onRefresh: () => vm.fetchData(false));
        }
      },
    );
  }
}

import 'package:demo_mvvm_with_flutter/data/remote/AirLineApi.dart';
import 'package:demo_mvvm_with_flutter/domain/AirLinesService.dart';
import 'package:demo_mvvm_with_flutter/ui/list/AirLineListPageVM.dart';
import 'package:kiwi/kiwi.dart';

part 'Injector.g.dart';

abstract class Injector {
  @Register.singleton(AirLineApi)
  @Register.singleton(AirLinesSevice)
  @Register.factory(AirLineListPageVM)
  void configure();
}

Injector getInjector() => _$Injector();

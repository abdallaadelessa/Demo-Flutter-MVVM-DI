
import 'package:demo_mvvm_with_flutter/data/airline/AirLineApi.dart';
import 'package:demo_mvvm_with_flutter/domain/airline/AirLinesService.dart';
import 'package:demo_mvvm_with_flutter/domain/airline/FavouritesService.dart';
import 'package:demo_mvvm_with_flutter/ui/list/AirLineListPageVM.dart';
import 'package:kiwi/kiwi.dart';

part 'Injector.g.dart';

abstract class Injector {
  @Register.singleton(AirLineApi)
  @Register.singleton(AirLinesService)
  @Register.singleton(FavouritesService)
  @Register.factory(AirLineListPageVM)
  void configure();
}

Injector getInjector() => _$Injector();

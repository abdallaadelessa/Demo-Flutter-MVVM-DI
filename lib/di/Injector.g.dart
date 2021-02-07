// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container.registerSingleton((c) => AirLineApi());
    container
        .registerSingleton((c) => AirLinesSevice(airLineApi: c<AirLineApi>()));
    container.registerFactory(
        (c) => AirLineListPageVM(airLineService: c<AirLinesSevice>()));
  }
}

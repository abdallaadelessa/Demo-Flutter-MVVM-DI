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
    container.registerSingleton((c) => AirLinesService(
        airLineApi: c<AirLineApi>(),
        favouritesService: c<FavouritesService>()));
    container.registerSingleton((c) => FavouritesService());
    container.registerFactory((c) => AirLineListPageVM(
        airLineService: c<AirLinesService>(),
        favouritesService: c<FavouritesService>()));
  }
}

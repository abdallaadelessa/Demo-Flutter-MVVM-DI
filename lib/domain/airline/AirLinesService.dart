import 'package:demo_mvvm_with_flutter/data/airline/AirLineApi.dart';
import 'package:demo_mvvm_with_flutter/domain/airline/FavouritesService.dart';
import 'package:demo_mvvm_with_flutter/domain/airline/model/AirLineDomainModel.dart';

class AirLinesService {
  final AirLineApi airLineApi;
  final FavouritesService favouritesService;

  AirLinesService({this.airLineApi, this.favouritesService});

  Future<List<AirLineDomainModel>> listAirLines() async {
    final dataFromFavourites = await favouritesService.list();
    final dataFromApi = await airLineApi.listAirLines();
    return dataFromApi.map((it) {
      final domainModel = new AirLineDomainModel(
          site: it.site,
          defaultName: it.defaultName,
          phone: it.phone,
          usName: it.usName,
          name: it.name,
          code: it.code,
          imageUrl: it.imageUrl);
      domainModel.isFavourite = dataFromFavourites.contains(domainModel);
      return domainModel;
    }).toList();
  }
}

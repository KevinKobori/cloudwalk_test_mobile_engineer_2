import 'package:nasa_apod_app/nasa_apod_app.dart';

class LocalLoadPicturesUseCase implements ILocalLoadPicturesUseCase {
  final ILocalStorage localStorage;

  LocalLoadPicturesUseCase({required this.localStorage});

  String itemKey = 'apod_objects';

  /// Example showcasing the implementation without using
  /// "package:multiple_result" and without adding intermediary
  /// treatments between the layers: Domain, Data, Infrastructure,
  /// and External.
  @override
  Future<List<PictureEntity>> loadLastTenDaysData() async {
    try {
      final data = await localStorage.fetch(itemKey);
      if (data?.isEmpty != false) {
        throw DomainException(DomainErrorType.unexpected);
      }

      return await _getEntityList(data);
    } catch (_) {
      throw DomainException(DomainErrorType.unexpected);
    }
  }

  @override
  Future<void> validateLastTenDaysData() async {
    try {
      final data = await localStorage.fetch(itemKey);
      await _getEntityList(data);
    } catch (_) {
      await localStorage.delete(itemKey);
    }
  }

  @override
  Future<void> saveLastTenDaysData(
      List<PictureEntity> pictureEntityList) async {
    try {
      final mapList = await _getMapList(pictureEntityList);
      await localStorage.save(key: itemKey, value: mapList);
    } catch (error) {
      throw DomainException(DomainErrorType.unexpected);
    }
  }

  Future<List<PictureEntity>> _getEntityList(dynamic data) async {
    return await PictureMapper().fromMapListToModelList(data).fold(
      (dataException) {
        throw dataException;
      },
      (pictureModelList) async {
        return await PictureMapper()
            .fromModelListToEntityList(pictureModelList)
            .fold((domainException) {
          throw domainException;
        }, (pictureEntityList) {
          return pictureEntityList;
        });
      },
    );
  }

  Future<List<Map<String, dynamic>>> _getMapList(
      List<PictureEntity> pictureEntityList) async {
    return await PictureMapper()
        .fromEntityListToModelList(pictureEntityList)
        .fold(
          (domainException) => throw domainException,
          (pictureModelList) async => await PictureMapper()
              .fromModelListToMapList(pictureModelList)
              .fold(
                (infraException) => throw DomainException(
                    infraException.errorType.dataError.domainError),
                (mapList) => mapList,
              ),
        );
  }
}

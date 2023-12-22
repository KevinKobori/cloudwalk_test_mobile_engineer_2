import 'package:dartz/dartz.dart';
import 'package:nasa_apod_app/nasa_apod_app.dart';

class PictureDatasourceImpl implements PictureDatasource {
  final HttpClient httpClient;

  PictureDatasourceImpl(this.httpClient);

  @override
  Future<Either<DomainFailure, List<PictureModel>>> fetchLastTenDaysData(
      String url) async {
    final requestResult =
        await httpClient.request(method: HttpVerbs.get, url: url);

    return await requestResult.fold(
      /// Left
      (httpFailure) => Left(httpFailure.fromHttpToDomain),

      /// Right
      (data) {
        final dynamicListResult = JsonMapper.tryDecode(data);
        return dynamicListResult.fold(
          /// Left
          (mapperFailure) => Left(mapperFailure.fromMapperToDomain),

          /// Right
          (dynamicList) {
            final mapListResult =
                JsonMapper.fromDynamicListToMapList(dynamicList);
            return mapListResult.fold(
              /// Left
              (mapperFailure) => Left(mapperFailure.fromMapperToDomain),

              /// Right
              (mapList) {
                final modelListResult =
                    PictureMapper().fromMapListToModelList(mapList);
                return modelListResult.fold(
                  /// Left
                  (mapperFailure) => Left(mapperFailure.fromMapperToDomain),

                  /// Right
                  (picturesList) => Right(picturesList),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Future<Either<DomainFailure, PictureModel>> fetchByDate(String url) async {
    // TODO: Repository and Usecase Layers
    final resultHttpClient =
        await httpClient.request(method: HttpVerbs.get, url: url);
    return resultHttpClient.fold(
      /// Left
      (httpFailure) => Left(httpFailure.fromHttpToDomain),

      /// Right
      (data) {
        final mapResult = JsonMapper.tryDecode(data);
        return mapResult.fold(
          /// Left
          (mapperFailure) => Left(mapperFailure.fromMapperToDomain),

          /// Right
          (pictureMap) {
            final modelResult = PictureMapper()
                .fromMapToModel(pictureMap as Map<String, dynamic>);
            return modelResult.fold(
              /// Left
              (mapperFailure) => Left(mapperFailure.fromMapperToDomain),

              /// Right
              (pictureModel) => Right(pictureModel),
            );
          },
        );
      },
    );
  }
}

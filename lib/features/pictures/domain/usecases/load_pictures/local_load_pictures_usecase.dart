import 'package:cloudwalk_test_mobile_engineer_2/cloudwalk_test_mobile_engineer_2.dart';
import 'package:multiple_result/multiple_result.dart';

class LocalLoadPicturesUsecase implements ILoadPicturesUseCase {
  final PictureRepository picturesRepository;
  final String url;

  LocalLoadPicturesUsecase({
    required this.picturesRepository,
    required this.url,
  });

  @override
  Future<Result<List<PictureEntity>, DomainException>>
      loadLastTenDaysData() async {
    final resultRepository = await picturesRepository.fetchLastTenDaysData(url);

    return resultRepository.when(
      (pictureModelList) {
        final resultEntity =
            PicturesMapper().fromModelListToEntityList(pictureModelList);
        return resultEntity.when(
          (pictureEntityList) => Success(pictureEntityList),
          (infraException) => Error(
              DomainException(infraException.errorType.dataError.domainError)),
        );
      },
      (dataException) =>
          Error(DomainException(dataException.errorType.domainError)),
    );
  }
}

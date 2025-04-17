import 'package:modu_image_search_app/domain/model/custom_image.dart';
import 'package:modu_image_search_app/domain/repository/image_repository.dart';

class GetImageDetailUsecase {
  final ImageRepository _imageRepository;

  const GetImageDetailUsecase(this._imageRepository);

  Future<CustomImage> execute(int id) async {
    return await _imageRepository.getImageDetail(id);
  }
}

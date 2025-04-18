import 'package:modu_image_search_app/domain/model/custom_image.dart';
import 'package:modu_image_search_app/domain/repository/image_repository.dart';

class GetImageUseCase {
  final ImageRepository _imageRepository;

  const GetImageUseCase(this._imageRepository);

  Future<List<CustomImage>> execute(String query) async {
    return await _imageRepository.searchImage(query);
  }
}

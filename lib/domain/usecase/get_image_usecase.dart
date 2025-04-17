import 'package:modu_image_search_app/domain/repository/image_repository.dart';

import '../model/image.dart';

class GetImageUseCase {
  final ImageRepository _imageRepository;

  const GetImageUseCase(this._imageRepository);

  Future<Image> execute(String query) async {
    List<Image> images = await _imageRepository.searchImage(query);
    return images;
  }
}

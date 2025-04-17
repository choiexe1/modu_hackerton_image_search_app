import 'package:modu_image_search_app/domain/model/custom_image.dart';

abstract interface class ImageRepository {
  Future<List<CustomImage>> searchImage(String query);
  Future<CustomImage> getImageDetail(int id);
}

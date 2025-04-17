import 'package:modu_image_search_app/domain/model/custom_image.dart';

abstract interface class PixabayApiDataSource {
  Future<List<CustomImage>> search(String query);
  Future<CustomImage> getDetail(int id);
}

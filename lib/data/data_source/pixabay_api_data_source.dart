import 'package:modu_image_search_app/domain/model/image.dart';

abstract interface class PixabayApiDataSource {
  Future<List<Image>> search(String query);
}

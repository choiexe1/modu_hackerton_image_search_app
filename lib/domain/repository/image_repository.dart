import 'package:modu_image_search_app/domain/model/image.dart';

abstract interface class ImageRepository {
  Future<List<Image>> searchImage(String query);
}

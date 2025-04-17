import 'package:modu_image_search_app/data/data_source/pixabay_api_data_source.dart';
import 'package:modu_image_search_app/domain/model/custom_image.dart';
import 'package:modu_image_search_app/domain/repository/image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final PixabayApiDataSource _dataSource;

  const ImageRepositoryImpl(this._dataSource);

  @override
  Future<List<CustomImage>> searchImage(String query) async {
    return await _dataSource.search(query);
  }

  @override
  Future<CustomImage> getImageDetail(int id) async {
    return await _dataSource.getDetail(id);
  }
}

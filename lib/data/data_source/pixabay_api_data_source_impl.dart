import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modu_image_search_app/data/data_source/pixabay_api_data_source.dart';
import 'package:modu_image_search_app/data/dto/image_dto.dart';
import 'package:modu_image_search_app/data/mapper/image_mapper.dart';
import 'package:modu_image_search_app/domain/model/custom_image.dart';

class PixabayApiDataSourceImpl implements PixabayApiDataSource {
  static const String apiUrl = 'https://pixabay.com/api/';

  final String _apiKey;
  final http.Client _client;

  const PixabayApiDataSourceImpl(this._apiKey, this._client);

  @override
  Future<List<CustomImage>> search(String query) async {
    final String url =
        '$apiUrl?key=$_apiKey&q=$query&image_type=photo&per_page=8';
    final http.Response response = await _client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      final List<dynamic> images = data['hits'];

      List<ImageDTO> dtos =
          images
              .cast<Map<String, dynamic>>()
              .map((e) => ImageDTO.fromJson(e))
              .toList();

      return dtos.map((dto) => dto.toModel()).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Future<CustomImage> getDetail(int id) async {
    final String url = '$apiUrl?key=$_apiKey&id=$id';
    // '$apiUrl?key=$_apiKey&q=$query&image_type=photo&per_page=8';
    final http.Response response = await _client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      final List<dynamic> image = data['hits'];

      ImageDTO dto = ImageDTO.fromJson(image[0]);

      return dto.toModel();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

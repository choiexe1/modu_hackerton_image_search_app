import 'package:modu_image_search_app/data/dto/image_dto.dart';
import 'package:modu_image_search_app/domain/model/custom_image.dart';

extension ImageMapper on ImageDTO {
  CustomImage toModel() {
    return CustomImage(
      id: id!,
      username: username!,
      imageUrl: imageUrl!,
      tags:
          tags!
              .split(',')
              .map((tag) => tag.trim())
              .where((tag) => tag.isNotEmpty)
              .toSet(),
    );
  }
}

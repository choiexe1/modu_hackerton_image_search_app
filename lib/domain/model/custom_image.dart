import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_image.freezed.dart';

@freezed
abstract class CustomImage with _$CustomImage {
  const factory CustomImage({
    required int id,
    required String username,
    required Set<String> tags,
    required String imageUrl,
  }) = _CustomImage;
}

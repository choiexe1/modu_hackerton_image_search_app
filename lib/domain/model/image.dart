import 'package:freezed_annotation/freezed_annotation.dart';

part 'image.freezed.dart';

@freezed
abstract class Image with _$Image {
  const factory Image({
    required int id,
    required String username,
    required Set<String> tags,
    required String imageUrl,
  }) = _Image;
}

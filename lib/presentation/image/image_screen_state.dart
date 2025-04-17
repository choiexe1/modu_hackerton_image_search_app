import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modu_image_search_app/domain/model/custom_image.dart';

part 'image_screen_state.freezed.dart';

@freezed
abstract class ImageScreenState with _$ImageScreenState {
  const factory ImageScreenState({
    @Default(false) bool isLoading,
    @Default(null) CustomImage? image,
  }) = _ImageScreenState;
}

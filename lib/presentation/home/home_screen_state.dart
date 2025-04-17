import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:modu_image_search_app/domain/model/custom_image.dart';

part 'home_screen_state.freezed.dart';

@freezed
abstract class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    @Default(false) bool isLoading,
    @Default([]) List<CustomImage> images,
    @Default('') String query,
  }) = _HomeScreenState;
}

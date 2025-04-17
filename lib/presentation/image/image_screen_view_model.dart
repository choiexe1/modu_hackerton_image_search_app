import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:modu_image_search_app/domain/usecase/get_image_detail_usecase.dart';
import 'package:modu_image_search_app/presentation/image/image_screen_state.dart';

class ImageScreenViewModel with ChangeNotifier {
  final GetImageDetailUsecase _getImageDetailUseCase;

  ImageScreenState _state = const ImageScreenState();

  ImageScreenViewModel(this._getImageDetailUseCase);

  bool get isLoading => _state.isLoading;
  ImageScreenState get state => _state;

  Future<void> fetchImage(int id) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final image = await _getImageDetailUseCase.execute(id);
    print('image = $image');

    _state = _state.copyWith(image: image, isLoading: false);

    notifyListeners();
  }
}

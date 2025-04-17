import 'package:flutter/foundation.dart';
import 'package:modu_image_search_app/domain/usecase/get_image_usecase.dart';
import 'package:modu_image_search_app/presentation/home/home_screen_state.dart';

class HomeScreenViewModel with ChangeNotifier {
  final GetImageUseCase _getImageUseCase;

  HomeScreenState _state = const HomeScreenState();

  HomeScreenViewModel(this._getImageUseCase);

  bool get isLoading => _state.isLoading;
  HomeScreenState get state => _state;

  Future<void> fetchImages(String query) async {
    _state = _state.copyWith(isLoading: true, query: query);
    notifyListeners();

    final images = await _getImageUseCase.execute(query);

    _state = _state.copyWith(images: images, isLoading: false);

    notifyListeners();
  }
}

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:modu_image_search_app/data/data_source/pixabay_api_data_source.dart';
import 'package:modu_image_search_app/data/data_source/pixabay_api_data_source_impl.dart';
import 'package:modu_image_search_app/data/repository/image_repository_impl.dart';
import 'package:modu_image_search_app/domain/repository/image_repository.dart';
import 'package:modu_image_search_app/domain/usecase/get_image_detail_usecase.dart';
import 'package:modu_image_search_app/domain/usecase/get_image_usecase.dart';
import 'package:modu_image_search_app/presentation/home/home_screen_view_model.dart';
import 'package:modu_image_search_app/presentation/image/image_screen_view_model.dart';

final getIt = GetIt.instance;

final String apiKey = dotenv.get('PIXABAY_API_KEY');
final http.Client client = http.Client();

void diSetup() {
  getIt.registerSingleton<PixabayApiDataSource>(
    PixabayApiDataSourceImpl(apiKey, client),
  );
  getIt.registerSingleton<ImageRepository>(ImageRepositoryImpl(getIt()));

  getIt.registerSingleton(GetImageUseCase(getIt()));
  getIt.registerSingleton(GetImageDetailUsecase(getIt()));

  getIt.registerFactory<ImageScreenViewModel>(
    () => ImageScreenViewModel(getIt()),
  );
  getIt.registerFactory<HomeScreenViewModel>(
    () => HomeScreenViewModel(getIt()),
  );
}

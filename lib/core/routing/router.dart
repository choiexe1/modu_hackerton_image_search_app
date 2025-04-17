import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:modu_image_search_app/core/routing/routes.dart';
import 'package:modu_image_search_app/data/data_source/pixabay_api_data_source.dart';
import 'package:modu_image_search_app/data/data_source/pixabay_api_data_source_impl.dart';
import 'package:modu_image_search_app/data/repository/image_repository_impl.dart';
import 'package:modu_image_search_app/domain/repository/image_repository.dart';
import 'package:modu_image_search_app/domain/usecase/get_image_detail_usecase.dart';
import 'package:modu_image_search_app/domain/usecase/get_image_usecase.dart';
import 'package:modu_image_search_app/presentation/home/home_screen.dart';
import 'package:modu_image_search_app/presentation/home/home_screen_view_model.dart';
import 'package:modu_image_search_app/presentation/image/image_screen.dart';
import 'package:modu_image_search_app/presentation/image/image_screen_view_model.dart';

final String apiKey = dotenv.get('PIXABAY_API_KEY');
final http.Client client = http.Client();

final PixabayApiDataSource pixabayApiDataSource = PixabayApiDataSourceImpl(
  apiKey,
  client,
);

final ImageRepository imageRepository = ImageRepositoryImpl(
  pixabayApiDataSource,
);

final GetImageUseCase getImageUseCase = GetImageUseCase(imageRepository);
final GetImageDetailUsecase getImageDetailUsecase = GetImageDetailUsecase(
  imageRepository,
);

final ImageScreenViewModel imageScreenViewModel = ImageScreenViewModel(
  getImageDetailUsecase,
);

final HomeScreenViewModel homeScreenViewModel = HomeScreenViewModel(
  getImageUseCase,
);

final GoRouter router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) => HomeScreen(viewModel: homeScreenViewModel),
    ),
    GoRoute(
      path: Routes.image,
      builder:
          (context, state) => ImageScreen(
            imageId: int.parse(state.pathParameters['id']!),
            viewModel: imageScreenViewModel,
          ),
    ),
  ],
);

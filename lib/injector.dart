import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/injector.config.dart';
import 'package:pokedex/utils/constants.dart';

final getIt = GetIt.instance;

@module
abstract class RegisterModule {
  @Named('BaseUrl')
  String get baseUrl => pokemonBaseURL;
  @singleton
  Dio dio(@Named('BaseUrl') String url) {
    final dio = Dio(BaseOptions(baseUrl: url));
    return dio;
  }
}

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();

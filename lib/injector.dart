import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/injector.config.dart';

final injector = GetIt.instance;

@module
abstract class RegisterModule {
  @Named('BaseUrl')
  String get baseUrl => '-----';
  @singleton
  Dio dio(@Named('BaseUrl') String url) {
    final dio = Dio(BaseOptions(baseUrl: url));
    return dio;
  }
}

@InjectableInit(
  preferRelativeImports: true,
  asExtension: false,
)
GetIt configureInjection([String environment = Environment.prod]) =>
    $initGetIt(injector, environment: environment);

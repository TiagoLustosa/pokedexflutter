// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'injector.dart' as _i11;
import 'presenter/bloc/pokemon_bloc.dart' as _i10;
import 'repositories/interfaces/i_pokemon_api_result_repository.dart' as _i4;
import 'repositories/interfaces/i_pokemon_repository.dart' as _i6;
import 'repositories/pokemon_api_result_repository_implements.dart' as _i5;
import 'repositories/pokemon_repository_implements.dart' as _i7;
import 'services/interfaces/i_pokemon_service.dart' as _i8;
import 'services/pokemon_service.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.factory<String>(() => registerModule.baseUrl, instanceName: 'BaseUrl');
  gh.singleton<_i3.Dio>(
      registerModule.dio(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i4.IPokemonApiResultRepository>(
      () => _i5.PokemonApiResultRepositoryImplements(get<_i3.Dio>()));
  gh.factory<_i6.IPokemonRepository>(
      () => _i7.PokemonRepositoryImplements(get<_i3.Dio>()));
  gh.factory<_i8.IPokemonService>(() => _i9.PokemonService(
      get<_i4.IPokemonApiResultRepository>(), get<_i6.IPokemonRepository>()));
  gh.factory<_i10.PokemonBloc>(
      () => _i10.PokemonBloc(pokemonService: get<_i8.IPokemonService>()));
  return get;
}

class _$RegisterModule extends _i11.RegisterModule {}

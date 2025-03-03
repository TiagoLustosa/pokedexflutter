// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'injector.dart' as _i811;
import 'presenter/bloc/pokemon_bloc.dart' as _i756;
import 'repositories/interfaces/i_pokemon_api_result_repository.dart' as _i772;
import 'repositories/interfaces/i_pokemon_repository.dart' as _i634;
import 'repositories/pokemon_api_result_repository_implements.dart' as _i716;
import 'repositories/pokemon_repository_implements.dart' as _i605;
import 'services/interfaces/i_pokemon_service.dart' as _i731;
import 'services/pokemon_service.dart' as _i680;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<String>(
      () => registerModule.baseUrl,
      instanceName: 'BaseUrl',
    );
    gh.singleton<_i361.Dio>(
        () => registerModule.dio(gh<String>(instanceName: 'BaseUrl')));
    gh.factory<_i772.IPokemonApiResultRepository>(
        () => _i716.PokemonApiResultRepositoryImplements(gh<_i361.Dio>()));
    gh.factory<_i634.IPokemonRepository>(
        () => _i605.PokemonRepositoryImplements(gh<_i361.Dio>()));
    gh.factory<_i731.IPokemonService>(() => _i680.PokemonService(
          gh<_i772.IPokemonApiResultRepository>(),
          gh<_i634.IPokemonRepository>(),
        ));
    gh.factory<_i756.PokemonBloc>(
        () => _i756.PokemonBloc(pokemonService: gh<_i731.IPokemonService>()));
    return this;
  }
}

class _$RegisterModule extends _i811.RegisterModule {}

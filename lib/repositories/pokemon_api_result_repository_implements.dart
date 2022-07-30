import 'package:dio/dio.dart';
import 'package:pokedex/models/pokemon_api_result.dart';
import 'package:pokedex/repositories/interfaces/i_pokemon_api_result_repository.dart';
import 'package:pokedex/utils/constants.dart';

class PokemonApiResultRepositoryImplements
    implements IPokemonApiResultRepository {
  final Dio _dio;

  PokemonApiResultRepositoryImplements(this._dio);
  @override
  Future<PokemonApiResult> getPokemonApiResult() async {
    final response = await _dio.get(pokemonBaseURL);
    if (response.data != null) {
      return PokemonApiResult.fromJson(response.data);
    } else {
      throw Exception();
    }
  }
}

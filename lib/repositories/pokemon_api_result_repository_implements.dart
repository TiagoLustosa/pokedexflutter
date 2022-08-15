import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/models/pokemon_api_result.dart';
import 'package:pokedex/repositories/interfaces/i_pokemon_api_result_repository.dart';
import 'package:pokedex/utils/constants.dart';

@Injectable(as: IPokemonApiResultRepository)
class PokemonApiResultRepositoryImplements
    implements IPokemonApiResultRepository {
  final Dio _dio;

  PokemonApiResultRepositoryImplements(this._dio);
  @override
  Future<PokemonApiResult> getPokemonApiResult([int startIndex = 0]) async {
    try {
      final response = await _dio.get(pokemonBaseURL, queryParameters: {
        'limit': 20,
        'offset': startIndex.toString(),
      });
      if (response.statusCode == 200 && response.data != null) {
        return PokemonApiResult.fromJson(response.data);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}

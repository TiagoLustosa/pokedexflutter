import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/repositories/interfaces/i_pokemon_repository.dart';

@Injectable(as: IPokemonRepository)
class PokemonRepositoryImplements implements IPokemonRepository {
  final Dio _dio;

  PokemonRepositoryImplements(this._dio);

  @override
  Future<Pokemon> getPokemonById(String urlFromApi) async {
    try {
      final response = await _dio.get(urlFromApi);
      if (response.statusCode == 200 && response.data != null) {
        return Pokemon.fromJson(response.data);
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Pokemon>> getMultiplePokemonsById(List<String> urls) async {
    try {
      final response = await Future.wait(urls.map((url) async {
        return await _dio.get(url);
      }));
      return response.map((res) => Pokemon.fromJson(res.data)).toList();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

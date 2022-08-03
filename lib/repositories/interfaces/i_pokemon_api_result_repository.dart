import 'package:pokedex/models/pokemon_api_result.dart';

abstract class IPokemonApiResultRepository {
  Future<PokemonApiResult> getPokemonApiResult([int startIndex = 0]);
}

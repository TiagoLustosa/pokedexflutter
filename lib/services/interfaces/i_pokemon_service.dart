import 'package:pokedex/models/pokemon.dart';

abstract class IPokemonService {
  Future<List<Pokemon>> getPokemons(int page);
}

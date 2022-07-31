import 'package:pokedex/models/pokemon.dart';

abstract class IPokemonRepository {
  Future<Pokemon> getPokemonById(String urlFromApi);
  Future<List<Pokemon>> getMultiplePokemonsById(List<String> urls);
}

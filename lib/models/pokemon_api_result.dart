import 'package:pokedex/models/pokemon_result_item.dart';

class PokemonAPIResult {
  final String next;
  final String previous;
  final List<PokemonResultItem> results;
  PokemonAPIResult({
    required this.next,
    required this.previous,
    required this.results,
  });
}

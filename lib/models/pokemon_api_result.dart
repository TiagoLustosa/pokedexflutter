import 'package:pokedex/models/pokemon_result_item.dart';

class PokemonApiResult {
  final String next;
  final String previous;
  final List<PokemonApiResultItem> results;
  PokemonApiResult({
    required this.next,
    required this.previous,
    required this.results,
  });

  factory PokemonApiResult.fromJson(Map<String, dynamic> json) {
    final results = (json['results'] as List)
        .map((result) => PokemonApiResultItem.fromJson(result))
        .toList();
    return PokemonApiResult(
      next: json['next'],
      previous: json['previous'] ?? '',
      results: results,
    );
  }
}

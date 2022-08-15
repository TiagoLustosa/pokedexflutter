import 'package:flutter/cupertino.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/presenter/components/pokemon_row_stats_widget.dart';

class PokemonDetailStats extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetailStats({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PokemonRowStats(
            statName: 'HP',
            statValue: pokemon.hp.toString(),
            statBarColor: pokemon.color),
        PokemonRowStats(
            statName: 'Attack',
            statValue: pokemon.attack.toString(),
            statBarColor: pokemon.color),
        PokemonRowStats(
            statName: 'Defense',
            statValue: pokemon.defense.toString(),
            statBarColor: pokemon.color),
        PokemonRowStats(
            statName: 'Sp. Atk',
            statValue: pokemon.specialAttack.toString(),
            statBarColor: pokemon.color),
        PokemonRowStats(
            statName: 'Sp. Def',
            statValue: pokemon.specialDefense.toString(),
            statBarColor: pokemon.color),
        PokemonRowStats(
            statName: 'Speed',
            statValue: pokemon.speed.toString(),
            statBarColor: pokemon.color),
      ],
    );
  }
}

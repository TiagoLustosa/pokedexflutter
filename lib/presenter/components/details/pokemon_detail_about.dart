import 'package:flutter/cupertino.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/presenter/components/pokemon_row_about.dart';
import 'package:pokedex/utils/extensions.dart';

class PokemonDetailAbout extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonDetailAbout({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PokemonRowAbout(
          about: 'Height',
          aboutValue: ('${(pokemon.height / 10).toStringAsFixed(2)} cm'),
        ),
        PokemonRowAbout(
          about: 'Weight',
          aboutValue: ('${(pokemon.weight / 10).toStringAsFixed(2)} kg'),
        ),
        PokemonRowAbout(
          about: 'Abilities',
          aboutValue: pokemon.abilities
              .map((e) => e.toFirstUpperCase())
              .toString()
              .replaceAll('(', '')
              .replaceAll(')', ''),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/presenter/components/details/pokemon_detail_button.dart';
import 'package:pokedex/presenter/components/details/pokemon_detail_stats.dart';
import 'package:pokedex/presenter/components/pokeball_widget.dart';
import 'package:pokedex/presenter/components/pokemon_image_widget.dart';
import 'package:pokedex/presenter/components/pokemon_type_text_widget.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/utils/responsive.dart';

class PokemonDetailView extends StatelessWidget {
  final bool isFavorite = true;
  const PokemonDetailView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon =
        ModalRoute.of(context)?.settings.arguments as Pokemon;

    final PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.favorite_border,
                  ),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: pokemon.color,
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              pokemon.name.toFirstUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: pokemon.textColor),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PokemonTypeText(
                  type: pokemon.types[0].toFirstUpperCase(),
                  color: pokemon.color as MaterialColor,
                  textStyle: Theme.of(context).textTheme.headline6?.copyWith(
                        color: pokemon.textColor,
                      ),
                ),
              ),
              if (pokemon.types.length > 1)
                PokemonTypeText(
                  type: pokemon.types[1].toFirstUpperCase(),
                  color: pokemon.color as MaterialColor,
                  textStyle: Theme.of(context).textTheme.headline6?.copyWith(
                        color: pokemon.textColor,
                      ),
                )
            ],
          ),
          SizedBox(
            height: 200,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                    alignment: Responsive(context).isLandscape
                        ? const Alignment(1, 1.8)
                        : const Alignment(1, 1.8),
                    child: PokeballWidget(color: pokemon.color, size: 86)),
                Align(
                  alignment: Alignment.topCenter,
                  child: PokemonImageWidget(
                    imageUrl: pokemon.imageURL,
                    imageSize: 200,
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 7,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.black87,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const PokemonDetailButton(
                        color: Colors.white, text: 'About'),
                    PokemonDetailButton(
                        color: pokemon.color, text: 'Base Stats'),
                    const PokemonDetailButton(
                        color: Colors.white, text: 'Evolution'),
                    const PokemonDetailButton(
                        color: Colors.white, text: 'Moves'),
                  ],
                ),
                SizedBox(
                  height: 300,
                  child: PageView(
                    children: [
                      PokemonDetailStats(pokemon: pokemon),
                      PokemonDetailStats(pokemon: pokemon)
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

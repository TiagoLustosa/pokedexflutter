import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/presenter/components/details/pokemon_detail_card.dart';
import 'package:pokedex/presenter/components/pokeball_widget.dart';
import 'package:pokedex/presenter/components/pokemon_image_widget.dart';
import 'package:pokedex/presenter/components/pokemon_type_text_widget.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/utils/responsive.dart';

class PokemonDetailView extends StatefulWidget {
  const PokemonDetailView({
    Key? key,
  }) : super(key: key);

  @override
  State<PokemonDetailView> createState() => _PokemonDetailViewState();
}

class _PokemonDetailViewState extends State<PokemonDetailView> {
  @override
  Widget build(BuildContext context) {
    final Pokemon pokemon =
        ModalRoute.of(context)?.settings.arguments as Pokemon;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: pokemon.isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.favorite_border,
                  ),
            onPressed: () {
              setState(() {
                pokemon.isFavorite = !pokemon.isFavorite;
              });
            },
          ),
        ],
      ),
      backgroundColor: pokemon.color,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                pokemon.name.toFirstUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
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
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: pokemon.textColor,
                        ),
                  ),
                ),
                if (pokemon.types.length > 1)
                  PokemonTypeText(
                    type: pokemon.types[1].toFirstUpperCase(),
                    color: pokemon.color as MaterialColor,
                    textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
            PokemonDetailCard(pokemon: pokemon)
          ],
        ),
      ),
    );
  }
}

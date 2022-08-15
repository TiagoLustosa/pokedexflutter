import 'package:flutter/material.dart';
import 'package:pokedex/presenter/components/pokeball_widget.dart';
import 'package:pokedex/presenter/components/pokemon_image_widget.dart';

class PokemonGridWidget extends StatelessWidget {
  final String imageUrl;
  final Color color;

  const PokemonGridWidget({
    Key? key,
    required this.imageUrl,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          PokeballWidget(
            color: color,
            size: 64,
          ),
          Positioned(
            bottom: 8,
            right: 10,
            child: PokemonImageWidget(
              imageUrl: imageUrl,
              imageSize: 120,
            ),
          )
        ],
      ),
    );
  }
}

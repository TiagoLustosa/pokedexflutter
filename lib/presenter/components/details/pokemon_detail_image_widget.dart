import 'package:flutter/material.dart';
import 'package:pokedex/presenter/components/pokeball_widget.dart';
import 'package:pokedex/presenter/components/pokemon_image_widget.dart';

class PokemonDetailImageWidget extends StatelessWidget {
  final String imageUrl;
  final Color color;
  const PokemonDetailImageWidget({
    Key? key,
    required this.imageUrl,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PokeballWidget(color: color, size: 86),
          PokemonImageWidget(
            imageUrl: imageUrl,
            imageSize: 240,
          )
        ],
      ),
    );
  }
}

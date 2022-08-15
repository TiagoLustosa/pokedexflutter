import 'package:flutter/material.dart';
import 'package:pokedex/presenter/components/pokemon_type_text_widget.dart';
import 'package:pokedex/utils/extensions.dart';

class PokemonTextWidget extends StatelessWidget {
  final String name;
  final List<String> types;
  final MaterialColor color;
  final Color textColor;

  const PokemonTextWidget({
    Key? key,
    required this.name,
    required this.types,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 16,
              ),
              child: Text(
                overflow: TextOverflow.ellipsis,
                name.toFirstUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(color: textColor),
              ),
            ),
          ),
        ],
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PokemonTypeText(
                  type: types[0].toFirstUpperCase(),
                  color: color,
                  textStyle: Theme.of(context).textTheme.headline5?.copyWith(
                        color: textColor,
                      ),
                ),
                if (types.length > 1)
                  PokemonTypeText(
                    type: types[1].toFirstUpperCase(),
                    color: color,
                    textStyle: Theme.of(context).textTheme.headline5?.copyWith(
                          color: textColor,
                        ),
                  ),
              ],
            ),
          ),
        ],
      )
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:pokedex/utils/extensions.dart';
import 'package:pokedex/utils/responsive.dart';

class PokemonTextWidget extends StatelessWidget {
  final String name;
  final List<String> types;
  final MaterialColor color;

  const PokemonTextWidget({
    Key? key,
    required this.name,
    required this.types,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Row(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              name.toFirstUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: Responsive(context).fontSize(20)),
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
                Container(
                  padding: const EdgeInsets.only(
                      top: 7, bottom: 7, left: 10, right: 10),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                      color: color[400],
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    types[0].toFirstUpperCase(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                if (types.length > 1)
                  Container(
                    padding: const EdgeInsets.only(
                        top: 7, bottom: 7, left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: color[400],
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      types[1].toFirstUpperCase(),
                      style: const TextStyle(color: Colors.white),
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

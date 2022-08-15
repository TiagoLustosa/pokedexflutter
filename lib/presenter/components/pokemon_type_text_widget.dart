import 'package:flutter/material.dart';

class PokemonTypeText extends StatelessWidget {
  final String type;
  final MaterialColor color;
  final TextStyle? textStyle;
  const PokemonTypeText(
      {Key? key,
      required this.type,
      required this.color,
      required this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 7,
        bottom: 7,
        left: 10,
        right: 10,
      ),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          color: color[400], borderRadius: BorderRadius.circular(10)),
      child: Text(
        type,
        style: textStyle,
      ),
    );
  }
}

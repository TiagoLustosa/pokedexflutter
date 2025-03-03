import 'package:flutter/material.dart';

class PokemonDetailButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;
  const PokemonDetailButton({
    Key? key,
    required this.color,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          padding: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: color, width: 3),
            ),
          ),
          child: Text(text,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: color)),
        ),
      ]),
    );
  }
}

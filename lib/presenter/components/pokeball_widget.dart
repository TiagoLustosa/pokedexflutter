import 'package:flutter/material.dart';

class PokeballWidget extends StatelessWidget {
  final Color color;
  final double size;

  /// Creates a widget that displays a pokeball.
  const PokeballWidget({
    Key? key,
    required this.color,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360),
            color: Colors.white.withOpacity(0.3),
          ),
          padding: EdgeInsets.all(size),
          child: const SizedBox.shrink(),
        ),
        SizedBox(
          height: size / 4,
          width: size * 2,
          child: ColoredBox(
            color: color,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360),
            color: color,
          ),
          padding: EdgeInsets.all(size / 2),
          child: const SizedBox.shrink(),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(360),
            color: Colors.white.withOpacity(0.3),
          ),
          padding: EdgeInsets.all(size / 4),
          child: const SizedBox.shrink(),
        ),
      ],
    );
  }
}

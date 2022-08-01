import 'package:flutter/material.dart';

class PokemonWidget extends StatelessWidget {
  final String imageUrl;
  final Color color;

  const PokemonWidget({
    Key? key,
    required this.imageUrl,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(120),
            color: Colors.white.withOpacity(0.3),
          ),
          padding: const EdgeInsets.all(64),
          child: const SizedBox.shrink(),
        ),
        SizedBox(
          height: 16,
          width: 128,
          child: ColoredBox(
            color: color,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: color,
          ),
          padding: const EdgeInsets.all(30),
          child: const SizedBox.shrink(),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Colors.white.withOpacity(0.3),
          ),
          padding: const EdgeInsets.all(16),
          child: const SizedBox.shrink(),
        ),
        Positioned(
          bottom: 8,
          right: 10,
          child: Image.network(
            imageUrl,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const SizedBox(
                  width: 50, height: 50, child: CircularProgressIndicator());
            },
            cacheHeight: 120,
            cacheWidth: 120,
          ),
        ),
      ],
    );
  }
}

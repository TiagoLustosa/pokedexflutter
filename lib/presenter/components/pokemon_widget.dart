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
          width: 120,
          height: 120,
          child: Image.network(
            imageUrl,
            errorBuilder: (context, error, stackTrace) => const Center(
              child: Text(
                'Image not found',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Padding(
                padding: const EdgeInsets.only(
                  top: 34,
                  bottom: 26,
                  left: 38,
                  right: 26,
                ),
                child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: Colors.indigo[900]!,
                    )),
              );
            },
            cacheHeight: 120,
            cacheWidth: 120,
          ),
        ),
      ],
    );
  }
}

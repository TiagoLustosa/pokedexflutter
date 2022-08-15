import 'package:flutter/material.dart';

class PokemonImageWidget extends StatelessWidget {
  final String imageUrl;
  // final double bottomPositioned;
  // final double rightPositioned;
  final double imageSize;
  const PokemonImageWidget({
    Key? key,
    required this.imageUrl,
    // required this.bottomPositioned,
    // required this.rightPositioned,
    required this.imageSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
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
      cacheHeight: imageSize.toInt(),
      cacheWidth: imageSize.toInt(),
      // ),
    );
  }
}

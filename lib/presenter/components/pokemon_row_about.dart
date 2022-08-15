import 'package:flutter/material.dart';

class PokemonRowAbout extends StatelessWidget {
  final String about;
  final String aboutValue;
  const PokemonRowAbout(
      {Key? key, required this.about, required this.aboutValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(about, style: Theme.of(context).textTheme.headline4),
        ),
      ),
      Flexible(
          fit: FlexFit.loose,
          flex: 2,
          child:
              Text(aboutValue, style: Theme.of(context).textTheme.headline4)),
    ]);
  }
}

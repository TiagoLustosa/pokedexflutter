import 'package:flutter/material.dart';

class PokemonRowStats extends StatelessWidget {
  final String statName;
  final String statValue;
  final Color statBarColor;

  const PokemonRowStats({
    Key? key,
    required this.statValue,
    required this.statName,
    required this.statBarColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(statName, style: Theme.of(context).textTheme.headline4),
          ),
        ),
        SizedBox(
          width: 32,
          child: Text(statValue, style: Theme.of(context).textTheme.headline4),
        ),
        Flexible(
          flex: 2,
          fit: FlexFit.loose,
          child: Stack(children: [
            Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(10)),
                width: 218,
                height: 16),
            Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: statBarColor,
                    borderRadius: BorderRadius.circular(10)),
                width: double.parse(statValue) * 2.20,
                height: 16),
          ]),
        ),
      ],
    );
  }
}

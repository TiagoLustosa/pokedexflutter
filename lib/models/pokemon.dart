import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final String name;
  final List<String> types;
  final String imageURL;

  Pokemon(
      {required this.id,
      required this.name,
      required this.imageURL,
      required this.types});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'] ?? 'sem nome',
      types: json['types'] == null
          ? List.empty()
          : (json['types'] as List)
              .map((type) => type['type']['name'].toString())
              .toList(),
      imageURL:
          json['sprites']['other']['official-artwork']['front_default'] ?? '',
    );
  }
  final Map<String, Color> _pokemonColorByType = {
    'fire': Colors.red,
    'grass': Colors.green,
    'water': Colors.blue,
    'normal': Colors.grey,
    'electric': Colors.yellow,
    'bug': Colors.lightGreen,
    'dragon': Colors.indigo,
    'fairy': Colors.pink,
    'fighting': Colors.orange,
    'ice': Colors.cyan,
    'poison': Colors.purple,
    'ground': Colors.brown,
    'flying': Colors.deepPurple,
    'psychic': Colors.deepOrange,
    'rock': Colors.lime,
    'ghost': Colors.blueGrey,
  };
  Color get color => _pokemonColorByType[types.first] ?? Colors.indigo;
  Color get textColor =>
      types.first == 'electric' ? Colors.black : Colors.white;
}

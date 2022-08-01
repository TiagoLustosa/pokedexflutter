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
      name: json['name'],
      types: (json['types'] as List)
          .map((type) => type['type']['name'].toString())
          .toList(),
      imageURL: json['sprites']['other']['official-artwork']['front_default'],
    );
  }
  final Map<String, Color> _pokemonColorByType = {
    'fire': Colors.red,
    'grass': Colors.green,
    'water': Colors.blue,
    'normal': Colors.grey,
    'electric': Colors.yellow,
    'bug': Colors.lightGreen,
  };
  Color get color => _pokemonColorByType[types.first] ?? Colors.indigo;
}

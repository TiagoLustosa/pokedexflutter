import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final String name;
  final List<String> types;
  final String imageURL;
  final int height;
  final int weight;
  final List<String> abilities;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  bool isFavorite = false;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.types,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.isFavorite,
  });

// create from json
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imageURL: json['sprites']['other']['official-artwork']['front_default'],
      types: json['types'] == null
          ? List.empty()
          : (json['types'] as List)
              .map((type) => type['type']['name'].toString())
              .toList(),
      height: json['height'],
      weight: json['weight'],
      abilities: json['abilities'] == null
          ? List.empty()
          : (json['abilities'] as List)
              .map((x) => x['ability']['name'].toString())
              .toList(),
      hp: json['stats'][0]['base_stat'],
      attack: json['stats'][1]['base_stat'],
      defense: json['stats'][2]['base_stat'],
      specialAttack: json['stats'][3]['base_stat'],
      specialDefense: json['stats'][4]['base_stat'],
      speed: json['stats'][5]['base_stat'],
      isFavorite: false,
    );
  }

  // factory Pokemon.fromJson(Map<String, dynamic> json) {
  //   return Pokemon(
  //     id: json['id'],
  //     name: json['name'] ?? 'sem nome',
  //     types: json['types'] == null
  //         ? List.empty()
  //         : (json['types'] as List)
  //             .map((type) => type['type']['name'].toString())
  //             .toList(),
  //     imageURL:
  //         json['sprites']['other']['official-artwork']['front_default'] ?? '',
  //   );
  // }
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

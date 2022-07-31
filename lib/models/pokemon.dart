class Pokemon {
  final int id;
  final String name;
  final String imageURL;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageURL,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      name: json['name'],
      imageURL: json['sprites']['other']['official-artwork']['front_default'],
    );
  }
}

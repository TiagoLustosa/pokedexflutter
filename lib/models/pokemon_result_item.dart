class PokemonApiResultItem {
  final String name;
  final String url;

  PokemonApiResultItem({
    required this.name,
    required this.url,
  });

  factory PokemonApiResultItem.fromJson(Map<String, dynamic> json) {
    return PokemonApiResultItem(
      name: json['name'],
      url: json['url'],
    );
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/repositories/interfaces/i_pokemon_repository.dart';

class PokemonRepositoryMock extends Mock implements IPokemonRepository {}

main() {
  final pokemonRepository = PokemonRepositoryMock();

  test('should return pokemon', () async {
    when(() =>
        pokemonRepository
            .getPokemonById(any())).thenAnswer((_) async => Pokemon(
        id: 1,
        name: 'bulbasaur',
        imageURL:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
        types: ['types'],
        height: 7,
        weight: 69,
        abilities: ['abilities'],
        hp: 70,
        attack: 55,
        defense: 47,
        specialAttack: 85,
        specialDefense: 52,
        speed: 25));
    final pokemon = await pokemonRepository
        .getPokemonById('https://pokeapi.co/api/v2/pokemon/1');
    expect(pokemon.imageURL,
        'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png');
    expect(pokemon, isA<Pokemon>());
  });
}

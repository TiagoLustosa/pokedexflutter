import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/interfaces/i_pokemon_service.dart';

class PokemonServiceMock extends Mock implements IPokemonService {}

main() {
  final pokemonServiceMock = PokemonServiceMock();
  test('should return a list of pokemons', () async {
    when(() => pokemonServiceMock.getPokemons(any())).thenAnswer((_) async {
      return [
        Pokemon(
          id: 1,
          name: 'bulbasaur',
          specialAttack: 50,
          specialDefense: 65,
          speed: 45,
          hp: 75,
          attack: 49,
          defense: 49,
          height: 7,
          weight: 69,
          abilities: ['overgrow'],
          types: ['grass'],
          isFavorite: false,
          imageURL:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
        ),
        Pokemon(
          id: 1,
          name: 'ivysaur',
          specialAttack: 55,
          specialDefense: 75,
          speed: 65,
          hp: 95,
          attack: 88,
          defense: 78,
          height: 7,
          weight: 70,
          abilities: ['overgrow'],
          types: ['grass'],
          isFavorite: false,
          imageURL:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
        ),
      ];
    });
    final pokemons = await pokemonServiceMock.getPokemons();
    expect(pokemons, isA<List<Pokemon>>());
    expect(pokemons[1].name, 'ivysaur');
  });
}

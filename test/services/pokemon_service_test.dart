import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/interfaces/i_pokemon_service.dart';

// class PokemonRepositoryMock extends Mock implements IPokemonRepository {}
// class PokemonApiResultRepositoryMock extends Mock implements IPokemonApiResultRepository {}
class PokemonServiceMock extends Mock implements IPokemonService {}

main() {
  final pokemonServiceMock = PokemonServiceMock();
  test('should return a list of pokemons', () async {
    when(() => pokemonServiceMock.getPokemons()).thenAnswer((_) async {
      return [
        Pokemon(
          id: 1,
          name: 'bulbasaur',
          imageURL:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
        ),
        Pokemon(
          id: 2,
          name: 'ivysaur',
          imageURL:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png',
        ),
      ];
    });
    final pokemons = await pokemonServiceMock.getPokemons();
    expect(pokemons, isA<List<Pokemon>>());
    expect(pokemons[1].name, 'ivysaur');
  });
}

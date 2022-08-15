import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/presenter/bloc/pokemon_bloc.dart';
import 'package:pokedex/services/interfaces/i_pokemon_service.dart';

class PokemonServiceMock extends Mock implements IPokemonService {}

main() {
  final pokemonServiceMock = PokemonServiceMock();

  blocTest<PokemonBloc, PokemonState>(
    'should return states',
    build: () {
      when(() => pokemonServiceMock.getPokemons(0)).thenAnswer((_) async =>
          List<Pokemon>.generate(
              20,
              (index) => Pokemon(
                  id: 1,
                  name: 'bulbasaur',
                  imageURL: 'imageURL',
                  types: ['types'],
                  height: 7,
                  weight: 69,
                  abilities: ['abilities'],
                  hp: 70,
                  attack: 55,
                  defense: 47,
                  specialAttack: 85,
                  specialDefense: 52,
                  speed: 25,
                  isFavorite: false)));
      return PokemonBloc(pokemonService: pokemonServiceMock);
    },
    act: (bloc) => bloc.add(GetPokemonsEvent()),
    expect: () => [
      isA<PokemonState>(),
    ],
  );
}

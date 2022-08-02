import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/models/pokemon_api_result.dart';
import 'package:pokedex/models/pokemon_result_item.dart';
import 'package:pokedex/repositories/interfaces/i_pokemon_api_result_repository.dart';

class PokemponApiResultMock extends Mock
    implements IPokemonApiResultRepository {}

void main() {
  final pokemonApiResultRepository = PokemponApiResultMock();
  test('should return a PokemonApiResult', () async {
    when(() => pokemonApiResultRepository.getPokemonApiResult(any()))
        .thenAnswer(
      (_) => Future.value(
        PokemonApiResult(
          next: 'next',
          previous: 'previous',
          results: [
            PokemonApiResultItem(
              name: 'name',
              url: 'url',
            ),
          ],
        ),
      ),
    );
    final result = await pokemonApiResultRepository.getPokemonApiResult(any());
    expect(result, isA<PokemonApiResult>());
  });

  test('should return an exception', () async {
    when(() => pokemonApiResultRepository.getPokemonApiResult(any()))
        .thenThrow(Exception(any()));
    expect(() => pokemonApiResultRepository.getPokemonApiResult(any()),
        throwsA(isA<Exception>()));
  });
}

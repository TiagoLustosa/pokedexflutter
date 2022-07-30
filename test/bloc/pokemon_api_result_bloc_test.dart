import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pokedex/models/pokemon_api_result.dart';
import 'package:pokedex/presenter/bloc/pokemon_api_result_bloc.dart';
import 'package:pokedex/repositories/interfaces/i_pokemon_api_result_repository.dart';

class PokemonApiResultRepositoryMock extends Mock
    implements IPokemonApiResultRepository {}

main() {
  final pokemonApiResultRepositoryMock = PokemonApiResultRepositoryMock();

  blocTest<PokemonApiResultBloc, PokemonApiResultState>(
    'should return loading and success states',
    build: () {
      when(() => pokemonApiResultRepositoryMock.getPokemonApiResult())
          .thenAnswer((_) async =>
              PokemonApiResult(next: '', previous: '', results: []));
      return PokemonApiResultBloc(
          pokemonApiResultRepository: pokemonApiResultRepositoryMock);
    },
    act: (bloc) => bloc.add(GetPokemonApiResult()),
    expect: () => [
      isA<PokemonApiResultLoading>(),
      isA<PokemonApiResultSuccess>(),
    ],
  );
  blocTest<PokemonApiResultBloc, PokemonApiResultState>(
    'should return an exception',
    build: () {
      when(() => pokemonApiResultRepositoryMock.getPokemonApiResult())
          .thenThrow(Exception());
      return PokemonApiResultBloc(
          pokemonApiResultRepository: pokemonApiResultRepositoryMock);
    },
    act: (bloc) => bloc.add(GetPokemonApiResult()),
    errors: () => [isA<Exception>()],
  );
}

part of 'pokemon_api_result_bloc.dart';

@immutable
abstract class PokemonApiResultState {}

class PokemonApiResultInitial extends PokemonApiResultState {}

class PokemonApiResultLoading extends PokemonApiResultState {}

class PokemonApiResultError extends PokemonApiResultState {}

class PokemonApiResultSuccess extends PokemonApiResultState {
  final List<Pokemon> pokemons;

  PokemonApiResultSuccess(this.pokemons);
}

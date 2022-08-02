part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoading extends PokemonState {}

class PokemonLoaded extends PokemonState {}

class PokemonLoadingNextPage extends PokemonState {}

class PokemonError extends PokemonState {}

class PokemonSuccess extends PokemonState {
  final List<Pokemon> pokemons;

  PokemonSuccess({required this.pokemons});
  List<Pokemon> get props => pokemons;
}

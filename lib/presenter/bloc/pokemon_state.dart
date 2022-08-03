part of 'pokemon_bloc.dart';

enum PokemonsStatus { initial, success, error }

class PokemonState extends Equatable {
  final PokemonsStatus status;
  final List<Pokemon> pokemons;
  final bool hasReachedMax;

  const PokemonState({
    this.status = PokemonsStatus.initial,
    this.pokemons = const <Pokemon>[],
    this.hasReachedMax = false,
  });

  PokemonState copyWith({
    PokemonsStatus? status,
    List<Pokemon>? pokemons,
    bool? hasReachedMax,
  }) {
    return PokemonState(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''PokemonState { status: $status, pokemons: $pokemons, hasReachedMax: $hasReachedMax }''';
  }

  @override
  List<Object> get props => [status, pokemons, hasReachedMax];
}

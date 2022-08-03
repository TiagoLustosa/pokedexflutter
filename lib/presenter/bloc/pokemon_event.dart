part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetPokemonsEvent extends PokemonEvent {
  GetPokemonsEvent();
}

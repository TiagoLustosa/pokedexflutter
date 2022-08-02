part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent {}

class GetPokemonsEvent extends PokemonEvent {
  final int page;

  GetPokemonsEvent(this.page);
}

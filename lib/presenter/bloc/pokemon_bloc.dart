import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:pokedex/services/interfaces/i_pokemon_service.dart';
import 'package:stream_transform/stream_transform.dart';
part 'pokemon_event.dart';
part 'pokemon_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

@injectable
class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final IPokemonService pokemonService;
  PokemonBloc({required this.pokemonService}) : super(const PokemonState()) {
    on<GetPokemonsEvent>(_getPokemons,
        transformer: throttleDroppable(throttleDuration));
  }
  FutureOr<void> _getPokemons(
      GetPokemonsEvent event, Emitter<PokemonState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == PokemonsStatus.initial) {
        final pokemons = await pokemonService.getPokemons(0);
        return emit(state.copyWith(
          status: PokemonsStatus.success,
          pokemons: pokemons,
          hasReachedMax: false,
        ));
      }
      final pokemons = await pokemonService.getPokemons(state.pokemons.length);
      pokemons.isEmpty
          ? emit(state.copyWith(hasReachedMax: true))
          : emit(state.copyWith(
              pokemons: List.of(state.pokemons)..addAll(pokemons),
              hasReachedMax: false,
            ));
    } catch (_) {
      emit(state.copyWith(status: PokemonsStatus.error));
    }
  }
}

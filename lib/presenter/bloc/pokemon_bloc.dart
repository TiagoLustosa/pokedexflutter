import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/interfaces/i_pokemon_service.dart';
part 'pokemon_event.dart';
part 'pokemon_state.dart';

@injectable
class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final IPokemonService pokemonService;
  final List<Pokemon> pokemons = [];
  PokemonBloc({required this.pokemonService}) : super(PokemonInitial()) {
    on<GetPokemonsEvent>(getPokemons);
  }
  FutureOr<void> getPokemons(GetPokemonsEvent event, Emitter emit) async {
    try {
      if (event.page == 0) {
        emit(PokemonLoading());
        final pokemon = await pokemonService.getPokemons(event.page);
        pokemons.addAll(pokemon);
        emit(PokemonSuccess(pokemons: pokemons));
      }
      if (state is PokemonSuccess) {
        state as PokemonSuccess;
      }

      if (event.page > 0) {
        final pokemon = await pokemonService.getPokemons(event.page);
        pokemons.addAll(pokemon);
        emit(PokemonSuccess(pokemons: pokemons));
      }
    } catch (e) {
      emit(PokemonError());
    }
  }
}

import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/services/interfaces/i_pokemon_service.dart';
part 'pokemon_api_result_event.dart';
part 'pokemon_api_result_state.dart';

@injectable
class PokemonApiResultBloc
    extends Bloc<PokemonApiResultEvent, PokemonApiResultState> {
  final IPokemonService pokemonService;
  PokemonApiResultBloc({required this.pokemonService})
      : super(PokemonApiResultInitial()) {
    on<GetPokemonsEvent>(getPokemonApiResult);
  }
  FutureOr<void> getPokemonApiResult(
      GetPokemonsEvent event, Emitter emit) async {
    emit(PokemonApiResultLoading());
    final pokemonApiResult = await pokemonService.getPokemons();
    if (pokemonApiResult is Exception) {
      emit(PokemonApiResultError());
    }
    emit(PokemonApiResultSuccess(pokemonApiResult));
  }
}

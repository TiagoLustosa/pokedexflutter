import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon_api_result.dart';
import 'package:pokedex/repositories/interfaces/i_pokemon_api_result_repository.dart';
part 'pokemon_api_result_event.dart';
part 'pokemon_api_result_state.dart';

@injectable
class PokemonApiResultBloc
    extends Bloc<PokemonApiResultEvent, PokemonApiResultState> {
  final IPokemonApiResultRepository pokemonApiResultRepository;
  PokemonApiResultBloc({required this.pokemonApiResultRepository})
      : super(PokemonApiResultInitial()) {
    on<GetPokemonApiResult>(getPokemonApiResult);
  }
  FutureOr<void> getPokemonApiResult(
      GetPokemonApiResult event, Emitter emit) async {
    emit(PokemonApiResultLoading());
    final pokemonApiResult =
        await pokemonApiResultRepository.getPokemonApiResult();
    if (pokemonApiResult is Exception) {
      emit(PokemonApiResultError());
    }
    emit(PokemonApiResultSuccess(pokemonApiResult));
  }
}

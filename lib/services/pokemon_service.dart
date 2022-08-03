import 'package:injectable/injectable.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/repositories/interfaces/i_pokemon_api_result_repository.dart';
import 'package:pokedex/repositories/interfaces/i_pokemon_repository.dart';
import 'package:pokedex/services/interfaces/i_pokemon_service.dart';

@Injectable(as: IPokemonService)
class PokemonService implements IPokemonService {
  final IPokemonApiResultRepository _pokemonApiResultRepository;
  final IPokemonRepository _pokemonRepository;

  PokemonService(this._pokemonApiResultRepository, this._pokemonRepository);
  @override
  Future<List<Pokemon>> getPokemons([int startIndex = 0]) async {
    final pokemonApiResult =
        await _pokemonApiResultRepository.getPokemonApiResult(startIndex);

    final pokemons = await _pokemonRepository.getMultiplePokemonsById(
        pokemonApiResult.results.map((result) => result.url).toList());
    return pokemons;
  }
}

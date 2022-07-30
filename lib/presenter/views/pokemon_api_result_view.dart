import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presenter/bloc/pokemon_api_result_bloc.dart';

class PokemonApiResultView extends StatelessWidget {
  const PokemonApiResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonApiResultBloc, PokemonApiResultState>(
      bloc: context.read<PokemonApiResultBloc>()..add(GetPokemonApiResult()),
      builder: (context, state) {
        if (state is PokemonApiResultLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PokemonApiResultSuccess) {
          return ListView.builder(itemBuilder: (context, index) {
            return Center(
              child: Text(state.pokemonApiResult.results[index].name),
            );
          });
        }
        return const Scaffold(
          body: Center(
            child: Text('PokemonApiResultView'),
          ),
        );
      },
    );
  }
}

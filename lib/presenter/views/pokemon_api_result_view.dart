import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presenter/bloc/pokemon_api_result_bloc.dart';

class PokemonApiResultView extends StatelessWidget {
  const PokemonApiResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonApiResultBloc, PokemonApiResultState>(
      bloc: context.read<PokemonApiResultBloc>()..add(GetPokemonsEvent()),
      builder: (context, state) {
        if (state is PokemonApiResultLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PokemonApiResultSuccess) {
          return ListView.builder(
              itemCount: state.pokemons.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(
                    children: [
                      Text(state.pokemons[index].name),
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: Image.network(
                          state.pokemons[index].imageURL,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return const CircularProgressIndicator();
                          },
                        ),
                      ),
                    ],
                  ),
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

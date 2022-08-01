import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presenter/bloc/pokemon_api_result_bloc.dart';
import 'package:pokedex/presenter/components/pokemon_text_widget.dart';
import 'package:pokedex/presenter/components/pokemon_widget.dart';
import 'package:pokedex/utils/responsive.dart';

class PokemonApiResultView extends StatelessWidget {
  const PokemonApiResultView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Pokedex',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.grey[200],
      ),
      body: BlocBuilder<PokemonApiResultBloc, PokemonApiResultState>(
        bloc: context.read<PokemonApiResultBloc>()..add(GetPokemonsEvent()),
        builder: (context, state) {
          if (state is PokemonApiResultLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PokemonApiResultSuccess) {
            return RefreshIndicator(
              onRefresh: () async =>
                  context.read<PokemonApiResultBloc>().add(GetPokemonsEvent()),
              child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1.2,
                      crossAxisCount: Responsive(context).orientation ==
                              Orientation.portrait
                          ? 2
                          : 3),
                  itemCount: state.pokemons.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.hardEdge,
                      color: state.pokemons[index].color,
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                            alignment: const Alignment(1.8, 2.8),
                            children: [
                              PokemonWidget(
                                  color: state.pokemons[index].color,
                                  imageUrl: state.pokemons[index].imageURL),
                              PokemonTextWidget(
                                  color: state.pokemons[index].color
                                      as MaterialColor,
                                  name: state.pokemons[index].name,
                                  types: state.pokemons[index].types)
                            ]),
                      ),
                    );
                  }),
            );
          }
          return const Scaffold(
            body: Center(
              child: Text('PokemonApiResultView'),
            ),
          );
        },
      ),
    );
  }
}

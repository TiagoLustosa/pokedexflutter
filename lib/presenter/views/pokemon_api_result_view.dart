import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presenter/bloc/pokemon_bloc.dart';
import 'package:pokedex/presenter/components/pokemon_text_widget.dart';
import 'package:pokedex/presenter/components/pokemon_widget.dart';
import 'package:pokedex/utils/responsive.dart';

class PokemonView extends StatefulWidget {
  const PokemonView({Key? key}) : super(key: key);

  @override
  State<PokemonView> createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {
  final scrollController = ScrollController();
  late PokemonState _pokemonState;
  int page = 0;
  dynamic test;
  @override
  void initState() {
    super.initState();
    scrollController
      ..removeListener(_onScroll)
      ..addListener(_onScroll);
    BlocProvider.of<PokemonBloc>(context).add(GetPokemonsEvent(0));
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  void _onScroll() {
    if ((scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) &&
        (_pokemonState is! PokemonLoading)) {
      page++;

      BlocProvider.of<PokemonBloc>(context).add(GetPokemonsEvent(page));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(14, 14, 14, 1),
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(
          'Pokedex',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          _pokemonState = state;
          if (state is PokemonLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PokemonSuccess) {
            return GridView.builder(
                controller: scrollController,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1.0,
                  crossAxisCount: Responsive(context).isLandscape ? 3 : 2,
                ),
                itemCount: state.pokemons.length,
                itemBuilder: (context, index) {
                  if (index >= state.pokemons.length - 1) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Loading more pokemons...',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ],
                    );
                  }

                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    clipBehavior: Clip.hardEdge,
                    color: state.pokemons[index].color,
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Stack(
                          alignment: const Alignment(1.4, 1.4),
                          children: [
                            PokemonWidget(
                                color: state.pokemons[index].color,
                                imageUrl: state.pokemons[index].imageURL),
                            PokemonTextWidget(
                                color: state.pokemons[index].color
                                    as MaterialColor,
                                name: state.pokemons[index].name,
                                types: state.pokemons[index].types,
                                textColor: state.pokemons[index].textColor),
                          ]),
                    ),
                  );
                });
          }
          return const Center(
            child: Text('Pokedex'),
          );
        },
      ),
    );
  }
}

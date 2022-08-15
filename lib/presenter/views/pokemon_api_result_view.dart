import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presenter/bloc/pokemon_bloc.dart';
import 'package:pokedex/presenter/components/pokemon_text_widget.dart';
import 'package:pokedex/presenter/components/pokemon_grid_widget.dart';
import 'package:pokedex/utils/responsive.dart';

class PokemonView extends StatefulWidget {
  const PokemonView({Key? key}) : super(key: key);

  @override
  State<PokemonView> createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {
  final _scrollController = ScrollController();
  int page = 0;
  @override
  void initState() {
    super.initState();
    _scrollController
      ..removeListener(_onScroll)
      ..addListener(_onScroll);
    BlocProvider.of<PokemonBloc>(context).add(GetPokemonsEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= maxScroll * 0.9;
  }

  void _onScroll() {
    if (_isBottom) context.read<PokemonBloc>().add(GetPokemonsEvent());
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
        body: BlocBuilder<PokemonBloc, PokemonState>(builder: (context, state) {
          switch (state.status) {
            case PokemonsStatus.error:
              return Center(
                child: Text('Failed to fetch pokemons',
                    style: Theme.of(context).textTheme.headline6),
              );

            case PokemonsStatus.success:
              return GridView.builder(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.0,
                    crossAxisCount: Responsive(context).isLandscape ? 3 : 2,
                  ),
                  itemCount: state.hasReachedMax
                      ? state.pokemons.length
                      : state.pokemons.length + 1,
                  itemBuilder: (context, index) {
                    if (index >= state.pokemons.length) {
                      if (state.pokemons.isEmpty) {
                        return const Center(
                            child: Text(
                          'No more pokemons',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 150,
                          ),
                        ));
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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

                    return GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed('/detail',
                          arguments: state.pokemons[index]),
                      child: Card(
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
                                PokemonGridWidget(
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
                      ),
                    );
                  });
            case PokemonsStatus.initial:
              return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}

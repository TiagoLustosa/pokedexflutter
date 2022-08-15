import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/presenter/components/details/pokemon_detail_about.dart';
import 'package:pokedex/presenter/components/details/pokemon_detail_button.dart';
import 'package:pokedex/presenter/components/details/pokemon_detail_stats.dart';

class PokemonDetailCard extends StatefulWidget {
  final Pokemon pokemon;
  const PokemonDetailCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<PokemonDetailCard> createState() => _PokemonDetailCardState(pokemon);
}

class _PokemonDetailCardState extends State<PokemonDetailCard> {
  final Pokemon pokemon;
  bool isFavorite = false;
  final PageController _controller = PageController();
  late int _currentPage;

  _PokemonDetailCardState(this.pokemon);

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page!.toInt();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.black87,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PokemonDetailButton(
                  color: _currentPage == 0 ? pokemon.color : Colors.white,
                  text: 'About',
                  onPressed: () {
                    _controller.jumpTo(0);
                  }),
              PokemonDetailButton(
                  color: _currentPage == 1 ? pokemon.color : Colors.white,
                  text: 'Base Stats',
                  onPressed: () {
                    _controller.jumpToPage(1);
                  }),
              // const PokemonDetailButton(
              //     color: Colors.white, text: 'Evolution'),
              // const PokemonDetailButton(
              //     color: Colors.white, text: 'Moves'),
            ],
          ),
          SizedBox(
            height: 300,
            child: PageView(
              controller: _controller,
              children: [
                PokemonDetailAbout(pokemon: pokemon),
                PokemonDetailStats(pokemon: pokemon),
              ],
            ),
          )
        ],
      ),
    );
  }
}

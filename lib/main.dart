import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/injector.dart';
import 'package:pokedex/presenter/bloc/pokemon_bloc.dart';
import 'package:pokedex/presenter/views/pokemon_api_result_view.dart';
import 'package:pokedex/presenter/views/pokemon_detail_view.dart';

void main() {
  configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonBloc>(
          create: (_) => injector<PokemonBloc>(),
          child: const PokemonView(),
        ),
        BlocProvider<PokemonBloc>(
          create: (_) => injector<PokemonBloc>(),
          child: const PokemonDetailView(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
            headline1: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline4: TextStyle(
              fontSize: 18,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline5: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        home: const PokemonView(),
        routes: {
          '/detail': (context) => const PokemonDetailView(),
        },
      ),
    );
  }
}

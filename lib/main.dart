import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/injector.dart';
import 'package:pokedex/presenter/bloc/pokemon_api_result_bloc.dart';
import 'package:pokedex/presenter/views/pokemon_api_result_view.dart';

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
        BlocProvider<PokemonApiResultBloc>(
          create: (_) => injector<PokemonApiResultBloc>(),
          child: const PokemonApiResultView(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PokemonApiResultView(),
      ),
    );
  }
}

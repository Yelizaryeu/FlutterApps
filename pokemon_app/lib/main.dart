import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/feature/presentation/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_app/feature/presentation/pages/pokemon_screen.dart';
import 'package:pokemon_app/locator_service.dart' as di;

import 'locator_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonListCubit>(
            create: (context) => sl<PokemonListCubit>()..loadPokemon()),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          backgroundColor: Color(0xFF24282F),
          scaffoldBackgroundColor: Color(0xFF24282F),
        ),
        home: HomePage(),
      ),
    );
  }
}

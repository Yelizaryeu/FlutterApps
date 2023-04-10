import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/feature/presentation/bloc/pokemon_list_bloc.dart';
//import 'package:pokemon_app/feature/presentation/cubit/pokemon_list_bloc.dart';
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
        BlocProvider<PokemonListBloc>(
            create: (context) =>
                sl<PokemonListBloc>()..add(LoadPokemonsEvent())),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color.fromARGB(255, 40, 40, 40),
        ),
        home: HomePage(),
      ),
    );
  }
}

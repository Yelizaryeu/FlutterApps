import 'package:flutter/material.dart';
import 'package:pokemon_app/feature/presentation/widgets/pokemon_list_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokémons',
          style: TextStyle(
            fontFamily: 'Pokemon',
            fontSize: 30.0,
            letterSpacing: 4.0,
          ),
        ),
        centerTitle: true,
        actions: [],
      ),
      body: PokemonsList(),
    );
  }
}

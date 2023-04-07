import 'package:flutter/material.dart';
import 'package:pokemon_app/feature/presentation/widgets/pokemon_list_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Characters'),
        centerTitle: true,
        actions: [],
      ),
      body: PokemonsList(),
    );
  }
}

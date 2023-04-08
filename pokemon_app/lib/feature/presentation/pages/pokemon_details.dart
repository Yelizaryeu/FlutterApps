import 'package:flutter/material.dart';
import 'package:pokemon_app/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/feature/presentation/widgets/pokemon_cache_image_widget.dart';
import 'package:meta/meta.dart';

class PokemonDetailPage extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonDetailPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Character'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              pokemon.name,
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            /*Text(
              pokemon.url,
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  List<Widget> buildText(String text, String value) {
    return [
      Text(
        text,
        style: TextStyle(
          color: Color(0xFF9E9E9E),
        ),
      ),
      SizedBox(
        height: 4,
      ),
      Text(
        value,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 12,
      ),
    ];
  }
}

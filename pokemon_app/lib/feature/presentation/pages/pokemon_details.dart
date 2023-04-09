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
        title: Text('Details'),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: PokemonCacheImage(
                  width: 275,
                  height: 275,
                  imageUrl: pokemon.sprite,
                ),
              ),
              const SizedBox(
                width: 16,
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
              Text(
                'height: ${pokemon.height.toString()}',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'weight: ${pokemon.weight.toString()}',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'types: ${pokemon.types.toString()}',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
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

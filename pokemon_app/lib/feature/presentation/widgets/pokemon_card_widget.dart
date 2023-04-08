import 'package:flutter/material.dart';
import 'package:pokemon_app/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/feature/presentation/pages/pokemon_details.dart';
import 'package:pokemon_app/feature/presentation/widgets/pokemon_cache_image_widget.dart';
//import 'package:rick_and_morty/feature/presentation/pages/person_detail_screen.dart';

class PokemonCard extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailPage(pokemon: pokemon),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF3C3E44),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Container(
              child: PokemonCacheImage(
                width: 166,
                height: 166,
                imageUrl: pokemon.sprite,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    pokemon.id.toString(),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:pokemon_app/feature/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel(
      {required super.id,
      required super.name,
      required super.sprite,
      required super.types,
      required super.weight,
      required super.height});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      sprite: json['sprites']['front_default'] ?? 'assets/images/noimage.jpg',
      types: json['types']['type']['name'] ?? '',
      weight: json['weight'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'sprites': {'front_default': this.sprite},
      'types': {
        'type': {'name': this.types}
      },
      'weight': weight,
      'height': height,
    };
  }
}

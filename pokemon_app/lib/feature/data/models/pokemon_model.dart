import 'package:pokemon_app/feature/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel(
      {required super.id,
      required super.name,
      //required super.url,
      required super.sprite,
      // required super.type,
      required super.weight,
      required super.height});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      //url: json['url'],
      sprite: json['sprites']['front_default'],
      // type: json['types']['type']['name'],
      weight: json['weight'],
      height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      //'url': url,
      'sprites'
          'front_default': sprite,
      //   'type': type,
      'weight': weight,
      'height': height,
    };
  }
}

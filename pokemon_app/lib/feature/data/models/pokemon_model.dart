import 'package:pokemon_app/feature/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({
    required super.id,
    required super.name,
    //required super.url,
    //required super.image,
    // required super.type,
    //required super.weight,
    //required super.height
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['id'],
      name: json['name'],
      //url: json['url'],
      //image: json['image'],
      // type: json['types']['type']['name'],
      //weight: json['weight'],
      //height: json['height'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      //'url': url,
      //'image': image,
      //   'type': type,
      //'weight': weight,
      //'height': height,
    };
  }
}

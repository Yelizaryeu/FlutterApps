import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  final int id;
  final String name;
  //final String url;
  final String sprite;
  // final String type;
  final int weight;
  final int height;

  PokemonEntity({
    required this.id,
    required this.name,
    //required this.url,
    required this.sprite,
    //required this.type,
    required this.weight,
    required this.height,
  });

  @override
  List<Object?> get props => [id, name, weight, height];
}

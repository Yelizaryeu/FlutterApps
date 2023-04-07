import 'package:equatable/equatable.dart';

class PokemonEntity extends Equatable {
  //final int id;
  final String name;
  //final String image;
  // final String type;
  //final int weight;
  //final int height;

  PokemonEntity({
    //required this.id,
    required this.name,
    //required this.image,
    //required this.type,
    // required this.weight,
    //required this.height,
  });

  @override
  List<Object?> get props => [name];
}

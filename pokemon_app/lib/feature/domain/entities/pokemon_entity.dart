class PokemonEntity {
  final int id;
  final String name;
  final String sprite;
  final List<dynamic> types;
  final int weight;
  final int height;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.sprite,
    required this.types,
    required this.weight,
    required this.height,
  });
}

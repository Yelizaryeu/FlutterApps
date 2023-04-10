import 'package:pokemon_app/feature/domain/entities/pokemon_entity.dart';

abstract class PokemonState {
  const PokemonState();
}

class PokemonEmpty extends PokemonState {}

class PokemonLoading extends PokemonState {
  final List<PokemonEntity> oldPokemonsList;
  final bool isFirstFetch;

  PokemonLoading(this.oldPokemonsList, {this.isFirstFetch = false});
}

class PokemonLoaded extends PokemonState {
  final List<PokemonEntity> pokemonsList;

  PokemonLoaded(this.pokemonsList);
}

class PokemonError extends PokemonState {
  final String message;

  PokemonError({required this.message});
}

import 'package:equatable/equatable.dart';
import 'package:pokemon_app/feature/domain/entities/pokemon_entity.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonEmpty extends PokemonState {
  @override
  List<Object> get props => [];
}

class PokemonLoading extends PokemonState {
  final List<PokemonEntity> oldPokemonsList;
  final bool isFirstFetch;

  PokemonLoading(this.oldPokemonsList, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldPokemonsList];
}

class PokemonLoaded extends PokemonState {
  final List<PokemonEntity> pokemonsList;

  PokemonLoaded(this.pokemonsList);

  @override
  List<Object> get props => [pokemonsList];
}

class PokemonError extends PokemonState {
  final String message;

  PokemonError({required this.message});

  @override
  List<Object> get props => [message];
}

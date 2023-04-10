part of 'pokemon_list_bloc.dart';

abstract class PokemonState {
  const PokemonState();
}

class PokemonEmptyState extends PokemonState {}

class PokemonLoadingState extends PokemonState {
  final List<PokemonEntity> oldPokemonsList;
  final bool isFirstFetch;

  PokemonLoadingState(this.oldPokemonsList, {this.isFirstFetch = false});
}

class PokemonLoadedState extends PokemonState {
  final List<PokemonEntity> pokemonsList;

  PokemonLoadedState(this.pokemonsList);
}

class PokemonErrorState extends PokemonState {
  final String message;

  PokemonErrorState({required this.message});
}

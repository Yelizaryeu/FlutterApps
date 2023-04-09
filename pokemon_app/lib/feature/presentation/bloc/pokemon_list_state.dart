part of 'pokemon_list_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonEmptyState extends PokemonState {
  @override
  List<Object> get props => [];
}

class PokemonLoadingState extends PokemonState {
  final List<PokemonEntity> oldPokemonsList;
  final bool isFirstFetch;

  PokemonLoadingState(this.oldPokemonsList, {this.isFirstFetch = false});

  @override
  List<Object> get props => [oldPokemonsList];
}

class PokemonLoadedState extends PokemonState {
  final List<PokemonEntity> pokemonsList;

  PokemonLoadedState(this.pokemonsList);

  @override
  List<Object> get props => [pokemonsList];
}

/*class PokemonSelected extends PokemonState {
  final PokemonEntity pokemon;

  PokemonSelected(this.pokemon);

  @override
  List<Object> get props => [pokemon];
}
*/
class PokemonErrorState extends PokemonState {
  final String message;

  PokemonErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

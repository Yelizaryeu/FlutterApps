part of 'pokemon_list_bloc.dart';

abstract class PokemonEvent {
  const PokemonEvent();
}

class LoadPokemonsEvent extends PokemonEvent {}

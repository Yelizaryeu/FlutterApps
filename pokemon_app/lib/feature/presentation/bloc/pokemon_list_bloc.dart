import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_app/core/error/failure.dart';
import 'package:pokemon_app/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/feature/domain/usecases/get_all_pokemons.dart';
import 'package:pokemon_app/feature/presentation/cubit/pokemon_list_bloc.dart';

part 'pokemon_list_event.dart';
part 'pokemon_list_state.dart';

class PokemonListBloc extends Bloc<PokemonEvent, PokemonState> {
  final GetAllPokemons getAllPokemons;

  PokemonListBloc({required this.getAllPokemons}) : super(PokemonEmptyState()) {
    int page = 1;
    on<LoadPokemonsEvent>((event, emit) async {
      if (state is PokemonLoadingState) return;

      final currentState = state;

      var oldPokemon = <PokemonEntity>[];
      if (currentState is PokemonLoadedState) {
        oldPokemon = currentState.pokemonsList;
      }

      emit(PokemonLoadingState(oldPokemon, isFirstFetch: page == 1));

      final failureOrPokemon =
          await getAllPokemons(PagePokemonParams(page: page));

      failureOrPokemon.fold(
          (error) =>
              emit(PokemonErrorState(message: _mapFailureToMessage(error))),
          (character) {
        page++;
        final pokemons = (state as PokemonLoadingState).oldPokemonsList;
        pokemons.addAll(character);

        print('List length: ${pokemons.length.toString()}');
        emit(PokemonLoadedState(pokemons));
      });
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}

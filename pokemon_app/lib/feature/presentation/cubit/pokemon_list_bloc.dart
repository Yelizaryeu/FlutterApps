import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/core/error/failure.dart';
import 'package:pokemon_app/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/feature/domain/usecases/get_all_pokemons.dart';
import 'package:pokemon_app/feature/presentation/cubit/pokemon_list_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class PokemonListCubit extends Cubit<PokemonState> {
  final GetAllPokemons getAllPokemons;

  PokemonListCubit({required this.getAllPokemons}) : super(PokemonEmpty());

  int page = 1;

  void loadPokemon() async {
    if (state is PokemonLoading) return;

    final currentState = state;

    var oldPokemon = <PokemonEntity>[];
    if (currentState is PokemonLoaded) {
      oldPokemon = currentState.pokemonsList;
    }

    emit(PokemonLoading(oldPokemon, isFirstFetch: page == 1));

    final failureOrPokemon =
        await getAllPokemons(PagePokemonParams(page: page));

    failureOrPokemon.fold(
        (error) => emit(PokemonError(message: _mapFailureToMessage(error))),
        (character) {
      page++;
      final pokemons = (state as PokemonLoading).oldPokemonsList;
      pokemons.addAll(character);

      print('List length: ${pokemons.length.toString()}');
      emit(PokemonLoaded(pokemons));
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

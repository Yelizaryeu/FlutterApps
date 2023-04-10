import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/error/failure.dart';
import 'package:pokemon_app/core/usecases/usecase.dart';
import 'package:pokemon_app/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/feature/domain/repositories/pokemon_repository.dart';

class GetAllPokemons extends UseCase<List<PokemonEntity>, PagePokemonParams> {
  final PokemonRepository pokemonRepository;

  GetAllPokemons(this.pokemonRepository);

  Future<Either<Failure, List<PokemonEntity>>> call(
      PagePokemonParams params) async {
    return await pokemonRepository.getAllPokemons(params.page);
  }
}

class PagePokemonParams {
  final int page;

  PagePokemonParams({required this.page});
}

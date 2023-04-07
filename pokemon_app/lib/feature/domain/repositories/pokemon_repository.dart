import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/error/failure.dart';
import 'package:pokemon_app/feature/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonEntity>>> getAllPokemons(int page);
}

import 'package:pokemon_app/core/error/exception.dart';
import 'package:pokemon_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pokemon_app/core/platform/network_info.dart';
import 'package:pokemon_app/feature/data/datasources/local_source.dart';
import 'package:pokemon_app/feature/data/datasources/remote_source.dart';
import 'package:pokemon_app/feature/data/models/pokemon_model.dart';
import 'package:pokemon_app/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/feature/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_app/feature/domain/usecases/get_all_pokemons.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<PokemonEntity>>> getAllPokemons(int page) async {
    return await _getPokemons(() {
      return remoteDataSource.getAllPokemons(page);
    });
  }

  Future<Either<Failure, List<PokemonModel>>> _getPokemons(
      Future<List<PokemonModel>> Function() getPokemons) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePokemon = await getPokemons();
        localDataSource.pokemonsToCache(remotePokemon);
        return Right(remotePokemon);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPerson = await localDataSource.getLastPokemonsFromCache();
        return Right(localPerson);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}

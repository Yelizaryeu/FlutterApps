import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pokemon_app/core/platform/network_info.dart';
import 'package:pokemon_app/feature/data/datasources/local_source.dart';
import 'package:pokemon_app/feature/data/datasources/remote_source.dart';
import 'package:pokemon_app/feature/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon_app/feature/domain/repositories/pokemon_repository.dart';
import 'package:pokemon_app/feature/domain/usecases/get_all_pokemons.dart';
import 'package:pokemon_app/feature/presentation/bloc/pokemon_list_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC / Cubit
  sl.registerFactory(
    () => PokemonListCubit(getAllPokemons: sl()),
  );

  // UseCases
  sl.registerLazySingleton(() => GetAllPokemons(sl()));

  // Repository
  sl.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: sl(),
    ),
  );

  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImlp(sharedPreferences: sl()),
  );

  // Core
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImp(sl()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}

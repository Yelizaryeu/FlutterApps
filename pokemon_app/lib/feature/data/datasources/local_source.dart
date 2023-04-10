import 'dart:convert';

import 'package:pokemon_app/core/error/exception.dart';
import 'package:pokemon_app/feature/data/models/pokemon_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDataSource {
  Future<List<PokemonModel>> getLastPokemonsFromCache();
  Future<void> pokemonsToCache(List<PokemonModel> pokemons);
}

const chachedPokemonsList = 'CHACHED_POKEMONS_LIST';

class LocalDataSourceImlp implements LocalDataSource {
  final SharedPreferences sharedPreferences;

  LocalDataSourceImlp({required this.sharedPreferences});
  @override
  Future<List<PokemonModel>> getLastPokemonsFromCache() {
    print('trying to get pokemons from cache');
    final jsonPokemonsList =
        sharedPreferences.getStringList(chachedPokemonsList);
    print('got this list ${jsonPokemonsList}');
    if (jsonPokemonsList!.isNotEmpty) {
      return Future.value(jsonPokemonsList
          .map((pokemon) => PokemonModel.fromJson(json.decode(pokemon)))
          .toList());
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> pokemonsToCache(List<PokemonModel> pokemons) {
    final List<String> jsonPokemonsList =
        pokemons.map((pokemon) => json.encode(pokemon.toJson())).toList();

    final cachedPokemons = sharedPreferences.getStringList(chachedPokemonsList);
    if (cachedPokemons != null) {
      sharedPreferences.setStringList(
          chachedPokemonsList, cachedPokemons + (jsonPokemonsList));
    } else {
      sharedPreferences.setStringList(chachedPokemonsList, jsonPokemonsList);
    }

    return Future.value(jsonPokemonsList);
  }
}

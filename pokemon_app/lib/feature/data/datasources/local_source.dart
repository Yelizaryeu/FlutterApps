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
    final jsonPokemonsList =
        sharedPreferences.getStringList(chachedPokemonsList);
    if (jsonPokemonsList!.isNotEmpty) {
      print('');
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

    sharedPreferences.setStringList(chachedPokemonsList, jsonPokemonsList);
    print('pokemons to write Cache: ${jsonPokemonsList.length}');
    return Future.value(jsonPokemonsList);
  }
}

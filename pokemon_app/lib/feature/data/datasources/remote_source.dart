import 'dart:convert';

import 'package:pokemon_app/core/error/exception.dart';
import 'package:pokemon_app/feature/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<PokemonModel>> getAllPokemons(int page);
  // Future<List<PokemonModel>> SearchPokemon(String query);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  // https://pokeapi.co/api/v2/pokemon/
  // https://pokeapi.co/api/v2/pokemon?offset=${page * 20}&limit=20

  RemoteDataSourceImpl({required this.client});
  @override
  Future<List<PokemonModel>> getAllPokemons(int page) async {
    final response = await client.get(
        Uri.parse('https://pokeapi.co/api/v2/pokemon/'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final pokemons = json.decode(response.body);
      return (pokemons['results'] as List)
          .map((pokemon) => PokemonModel.fromJson(pokemon))
          .toList();
    } else {
      throw ServerException();
    }
  }
}

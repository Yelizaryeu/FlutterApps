import 'dart:convert';

import 'package:pokemon_app/core/error/exception.dart';
import 'package:pokemon_app/feature/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<PokemonModel>> getAllPokemons(int page);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  // https://pokeapi.co/api/v2/pokemon/
  // https://pokeapi.co/api/v2/pokemon?offset=${page * 20}&limit=20

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<PokemonModel>> getAllPokemons(int page) async {
    final response = await http.get(Uri.parse(
        'https://pokeapi.co/api/v2/pokemon?offset=${(page - 1) * 20}&limit=20'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> results = json['results'];
      final List<PokemonModel> pokemonList = [];
      for (final result in results) {
        final pokemon = await getPokemonDetails(result['url']);
        pokemonList.add(pokemon);
      }
      return pokemonList;
    } else {
      throw ServerException();
    }
  }

  Future<PokemonModel> getPokemonDetails(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final String name = json['name'];
      final int id = json['id'];
      final int height = json['height'];
      final int weight = json['weight'];
      final String sprite = json['sprites']['front_default'];
      final List<dynamic> types = json['types'];
      final List<String> typeNames =
          types.map((type) => type['type']['name'] as String).toList();
      return PokemonModel(
        name: name,
        id: id,
        types: typeNames,
        sprite: sprite,
        weight: weight,
        height: height,
      );
    } else {
      throw ServerException();
    }
  }
}

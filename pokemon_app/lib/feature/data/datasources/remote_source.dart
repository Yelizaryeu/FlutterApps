import 'dart:convert';

import 'package:pokemon_app/core/error/exception.dart';
import 'package:pokemon_app/feature/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/feature/domain/entities/pokemon_entity.dart';

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
      throw Exception('Failed to load Pokémon list');
    }
  }

  /* @override
  Future<List<PokemonModel>> getAllPokemons(int page) async {
    List<PokemonModel> finalPokemons = [];
    print('trying to get names');
    final response = await client.get(
        Uri.parse(
            'https://pokeapi.co/api/v2/pokemon?offset=${page * 20}&limit=20'),
        headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final pokemons = json.decode(response.body);
      final results = (pokemons['results'] as List)
          .map((pokemon) => PokemonModel.fromJson(pokemon))
          .toList();
      print('pokemons info: ${results}');
      PokemonModel profile;
      for (profile in pokemonsProfiles) {
        print('trying get details on ${profile.name}');
        final detailsResponse = await client.get(
          Uri.parse(profile.url),
          headers: {'Content-Type': 'application/json'},
        );
        if (detailsResponse.statusCode == 200) {
          final pokemonDetails = json.decode(detailsResponse.body);
          final details = (pokemonDetails as List)
              .map((pokemon) => PokemonModel.fromJson(pokemon));
          finalPokemons.add(details as PokemonModel);
        }
      }
      return finalPokemons;
      //print('pokemons urls: ${pokemonsUrl}');
      //print('got pokemons names $names');
      /*var name;
      for (name in names) {
        print('trying to get ${name}s details');
        final detailsResponse = await client.get(
            Uri.parse('https://pokeapi.co/api/v2/pokemon/${name}'),
            headers: {'Content-Type': 'application/json'});
        if (detailsResponse.statusCode == 200) {
          final pokemonDetails = json.decode(detailsResponse.body);
          final details = (pokemonDetails as List)
              .map((pokemon) => PokemonModel.fromJson(pokemon));
          pokemons.add(details as PokemonModel);
        }
      }
      return pokemons;*/
      //return pokemonsUrl;
    } else {
      throw ServerException();
    }
  }*/

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
      throw Exception('Failed to load Pokémon details');
    }
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_app/feature/data/datasources/remote_source.dart';

void main() {
  test('getPokemonDetails should return bulbasaur details', () async {
    // ARRANGE
    final bulbasaur = 'bulbasaur';
    // ACT
    final pokemon = await RemoteDataSourceImpl.getPokemonDetails(
        'https://pokeapi.co/api/v2/pokemon/1/');
    // ASSERT
    expect(pokemon.name, bulbasaur);
  });
}

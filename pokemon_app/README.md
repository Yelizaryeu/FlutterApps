# PokeDex

A simple application to view pokemons.

## Functionality

- display pokemon names from [PokeApi](https://pokeapi.co/api/v2/pokemon) in a List.
- When a user clicks on cell, then the details screen is opened.
- The Pokemon details page show the next information:
	- The Pokemon's name
	- A single image of the pokemon from the front
	- The Pokemon's "types" e.g. grass
	- The Pokemon's weight in kg
	- The Pokemon's height in cm
- handle all possible states of the app (offline, data not loading, errors, etc).
- Data cached in the database to support offline mode.

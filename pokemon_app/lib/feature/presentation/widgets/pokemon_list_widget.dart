import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/feature/domain/entities/pokemon_entity.dart';
import 'package:pokemon_app/feature/presentation/bloc/pokemon_list_bloc.dart';
import 'package:pokemon_app/feature/presentation/bloc/pokemon_list_state.dart';
import 'package:pokemon_app/feature/presentation/widgets/pokemon_card_widget.dart';

class PokemonsList extends StatelessWidget {
  final scrollController = ScrollController();
  int page = 1;
  void setupScrollController(BuildContext context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          //BlocProvider.of<PersonListCubit>(context).loadPerson();
          context.read<PokemonListCubit>().loadPokemon();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController(context);

    return BlocBuilder<PokemonListCubit, PokemonState>(
        builder: (context, state) {
      List<PokemonEntity> pokemons = [];
      bool isLoading = false;

      if (state is PokemonLoading && state.isFirstFetch) {
        return _loadingIndicator();
      } else if (state is PokemonLoading) {
        pokemons = state.oldPokemonsList;
        isLoading = true;
      } else if (state is PokemonLoaded) {
        pokemons = state.pokemonsList;
      } else if (state is PokemonError) {
        return Text(
          state.message,
          style: TextStyle(color: Colors.white, fontSize: 25),
        );
      }
      return ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index < pokemons.length) {
            return PokemonCard(pokemon: pokemons[index]);
          } else {
            Timer(Duration(milliseconds: 30), () {
              scrollController
                  .jumpTo(scrollController.position.maxScrollExtent);
            });
            return _loadingIndicator();
          }
        },
        separatorBuilder: (context, index) {
          return Divider(
            color: Colors.grey[400],
          );
        },
        itemCount: pokemons.length + (isLoading ? 1 : 0),
      );
    });
  }

  Widget _loadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

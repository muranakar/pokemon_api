import 'package:flutter/material.dart';
import 'widgets/pokemon_list.dart';

void main() => runApp(PokemonApp());

class PokemonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokémon API Client',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Pokémon List'),
        ),
        body: PokemonList(),
      ),
    );
  }
}

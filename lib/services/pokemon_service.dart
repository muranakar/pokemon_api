// services/pokemon_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_api/model/pokemon.dart';


class PokemonService {
  final String baseUrl = 'https://pokeapi.co/api/v2';

  Future<List<Pokemon>> fetchPokemonList({int limit = 20, int offset = 0}) async {
    final response = await http.get(Uri.parse('$baseUrl/pokemon?limit=$limit&offset=$offset'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((json) => Pokemon.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Pokémon data');
    }
  }
}

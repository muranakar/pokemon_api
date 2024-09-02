// services/pokemon_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_api/model/pokemon.dart';

class PokemonService {
  final String baseUrl = 'https://pokeapi.co/api/v2';

  Future<List<Pokemon>> fetchPokemonList(
      {int limit = 20, int offset = 0}) async {
    final response = await http
        .get(Uri.parse('$baseUrl/pokemon?limit=$limit&offset=$offset'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((json) => Pokemon.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Pokémon data');
    }
  }
}

// APIのレスポンス例
// https://pokeapi.co/api/v2/pokemon?limit=20&offset=0
///
/*
{
"count": 1302,
"next": "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20",
"previous": null,
"results": [
{
"name": "bulbasaur",
"url": "https://pokeapi.co/api/v2/pokemon/1/"
},
{
"name": "ivysaur",
"url": "https://pokeapi.co/api/v2/pokemon/2/"
},
{
"name": "venusaur",
"url": "https://pokeapi.co/api/v2/pokemon/3/"
},
{
"name": "charmander",
"url": "https://pokeapi.co/api/v2/pokemon/4/"
},
{
"name": "charmeleon",
"url": "https://pokeapi.co/api/v2/pokemon/5/"
},
{
"name": "charizard",
"url": "https://pokeapi.co/api/v2/pokemon/6/"
},
{
"name": "squirtle",
"url": "https://pokeapi.co/api/v2/pokemon/7/"
},
{
"name": "wartortle",
"url": "https://pokeapi.co/api/v2/pokemon/8/"
},
{
"name": "blastoise",
"url": "https://pokeapi.co/api/v2/pokemon/9/"
},
{
"name": "caterpie",
"url": "https://pokeapi.co/api/v2/pokemon/10/"
},
{
"name": "metapod",
"url": "https://pokeapi.co/api/v2/pokemon/11/"
},
{
"name": "butterfree",
"url": "https://pokeapi.co/api/v2/pokemon/12/"
},
{
"name": "weedle",
"url": "https://pokeapi.co/api/v2/pokemon/13/"
},
{
"name": "kakuna",
"url": "https://pokeapi.co/api/v2/pokemon/14/"
},
{
"name": "beedrill",
"url": "https://pokeapi.co/api/v2/pokemon/15/"
},
{
"name": "pidgey",
"url": "https://pokeapi.co/api/v2/pokemon/16/"
},
{
"name": "pidgeotto",
"url": "https://pokeapi.co/api/v2/pokemon/17/"
},
{
"name": "pidgeot",
"url": "https://pokeapi.co/api/v2/pokemon/18/"
},
{
"name": "rattata",
"url": "https://pokeapi.co/api/v2/pokemon/19/"
},
{
"name": "raticate",
"url": "https://pokeapi.co/api/v2/pokemon/20/"
}
]
}
*/
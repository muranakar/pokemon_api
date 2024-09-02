import 'package:flutter/material.dart';
import 'package:pokemon_api/model/pokemon.dart';

import '../services/pokemon_service.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  final PokemonService _pokemonService = PokemonService();
  List<Pokemon> _pokemonList = [];
  bool _isLoading = true;
  bool _isFetchingMore = false;
  int _offset = 0;
  final int _limit = 20; // 一度に取得するポケモンの数
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _fetchPokemon();

    // スクロールイベントのリスナーを追加
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchMorePokemon();
      }
    });
  }

  Future<void> _fetchPokemon() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final pokemonList =
          await _pokemonService.fetchPokemonList(limit: _limit, offset: _offset);
      setState(() {
        _pokemonList.addAll(pokemonList);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print(e); // エラーハンドリング
    }
  }

  Future<void> _fetchMorePokemon() async {
    if (_isFetchingMore) return; // データ取得中に再度リクエストが発生しないようにする

    setState(() {
      _isFetchingMore = true;
    });

    _offset += _limit;

    try {
      final pokemonList =
          await _pokemonService.fetchPokemonList(limit: _limit, offset: _offset);
      setState(() {
        _pokemonList.addAll(pokemonList);
        _isFetchingMore = false;
      });
    } catch (e) {
      setState(() {
        _isFetchingMore = false;
      });
      print(e); // エラーハンドリング
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading && _pokemonList.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        ListView.builder(
          controller: _scrollController, // ScrollControllerを設定
          itemCount: _pokemonList.length + 1, // ローディングインジケーターのために+1
          itemBuilder: (context, index) {
            if (index < _pokemonList.length) {
              final pokemon = _pokemonList[index];
              return ListTile(
                leading: Image.network(pokemon.imageUrl),
                title: Text(pokemon.name),
              );
            } else {
              // ローディングインジケーターをリストの末尾に表示
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: _isFetchingMore
                      ? CircularProgressIndicator()
                      : SizedBox.shrink(),
                ),
              );
            }
          },
        ),
        if (_isLoading && _pokemonList.isEmpty)
          Center(child: CircularProgressIndicator()),
      ],
    );
  }
}

class Pokemon {
  final String name;
  final String url;
  final String imageUrl;

  Pokemon({required this.name, required this.url})
      : imageUrl = _generateImageUrl(url);

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      url: json['url'],
    );
  }

  static String _generateImageUrl(String url) {
    final id = _extractIdFromUrl(url);
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  }

  static String _extractIdFromUrl(String url) {
    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    return segments[segments.length - 2]; // URLの末尾の数字部分がID
  }
}

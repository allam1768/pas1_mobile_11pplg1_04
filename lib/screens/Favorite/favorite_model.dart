class FavoriteBola {
  final int malId;
  final String title;
  final String type;
  final String aired;
  final String genres;
  final int popularity;
  final String imageUrl;

  FavoriteBola({
    required this.malId,
    required this.title,
    required this.type,
    required this.aired,
    required this.genres,
    required this.popularity,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'malId': malId,
      'title': title,
      'type': type,
      'aired': aired,
      'genres': genres,
      'popularity': popularity,
      'imageUrl': imageUrl,
    };
  }

  factory FavoriteBola.fromMap(Map<String, dynamic> map) {
    return FavoriteBola(
      malId: map['malId'],
      title: map['title'],
      type: map['type'],
      aired: map['aired'],
      genres: map['genres'],
      popularity: map['popularity'],
      imageUrl: map['imageUrl'],
    );
  }
} 
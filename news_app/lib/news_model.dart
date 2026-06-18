class MovieModel {
  final int id;
  final String title;
  final String? overview; // deskripsi
  final String? posterPath; // gambar
  final String? backdropPath;
  final double? voteAverage;
  final String? releaseDate;

  MovieModel({
    required this.id,
    required this.title,
    this.overview,
    this.posterPath,
    this.backdropPath,
    this.voteAverage,
    this.releaseDate,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'No Title',
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      voteAverage: json['vote_average']?.toDouble(),
      releaseDate: json['release_date'],
    );
  }
  String get posterUrl => 'https://image.tmdb.org/t/p/w500$posterPath';
  String get backdropUrl => 'https://image.tmdb.org/t/p/original$backdropPath';
}

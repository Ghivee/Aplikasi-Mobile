import 'dart:convert';
import 'package:http/http.dart' as http;
import 'news_model.dart';

class TmdbService {
  static const String _apiKey = 'REMOVED_API_KEY';
  static const String _baseUrl = 'https://api.themoviedb.org/3';

  Future<List<MovieModel>> fetchPopularMovies() async {
    final uri = Uri.parse(
      '$_baseUrl/movie/popular?api_key=$_apiKey&language=en-US&page=1',
    );
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal memuat film populer');
    }
  }

  Future<MovieModel> fetchMovieDetail(int movieId) async {
    final uri = Uri.parse(
      '$_baseUrl/movie/$movieId?api_key=$_apiKey&language=en-US',
    );
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return MovieModel.fromJson(json);
    } else {
      throw Exception('Gagal memuat detail film');
    }
  }
}

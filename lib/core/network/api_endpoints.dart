class ApiEndpoints {

  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String popularMovies = '$baseUrl/movie/popular';
  static const String topRatedMovies = '$baseUrl/movie/top_rated';
  static const String nowPlayingMovies = '$baseUrl/movie/now_playing';
  static const String upcomingMovies = '$baseUrl/movie/upcoming';
  static const String movieDetails = '$baseUrl/movie'; // Use with ID: movie/{id}
  static const String searchMovies = '$baseUrl/search/movie';
}
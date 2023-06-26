import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import '../../domain/entites/movie.dart';

class MovieStates extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popularMovies;
  final RequestState popularMoviesState;
  final String popularMoviesMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMoviesMessage;

  MovieStates({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularMoviesState = RequestState.loading,
    this.popularMoviesMessage = '',
    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestState.loading,
    this.topRatedMoviesMessage = '',
  });

  MovieStates copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popularMovies,
    RequestState? popularMoviesState,
    String? popularMoviesMessage,
    List<Movie>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMoviesMessage,
  }) {
    return MovieStates(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      popularMoviesMessage: popularMoviesMessage ?? this.popularMoviesMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMoviesMessage:
          topRatedMoviesMessage ?? this.topRatedMoviesMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMovies,
        popularMoviesState,
        popularMoviesMessage,
        topRatedMovies,
        topRatedMoviesState,
        topRatedMoviesMessage,
      ];
}

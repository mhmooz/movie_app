import 'package:equatable/equatable.dart';
import 'package:movie_app/movie/domain/entites/geners.dart';

class MovieDetail extends Equatable {
  final int id;
  final List<Genres> genres;
  final String backDropPath;
  final String title;
  final String overView;
  final String releaseDate;
  final double voteAverage;
  final int runTime;

  const MovieDetail(
      {required this.id,
      required this.genres,
      required this.backDropPath,
      required this.title,
      required this.overView,
      required this.releaseDate,
      required this.voteAverage,
      required this.runTime});

  @override
  List<Object?> get props => [id, genres, backDropPath, title, overView, releaseDate, voteAverage, runTime];

}

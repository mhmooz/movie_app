import 'package:movie_app/movie/data/models/genres_model.dart';
import 'package:movie_app/movie/domain/entites/movie_detail.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel(
      {required super.id,
      required super.genres,
      required super.backDropPath,
      required super.title,
      required super.overView,
      required super.releaseDate,
      required super.voteAverage,
      required super.runTime});

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) => MovieDetailModel(
        id: json['id'],
        genres: List<GenresModel>.from(json['genres'].map((e)=> GenresModel.fromJson(e))),
        backDropPath: json['backdrop_path'],
        title: json['original_title'],
        overView: json['overview'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average'].toDouble(),
        runTime: json['runtime'],
      );
}

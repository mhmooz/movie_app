import 'package:dartz/dartz.dart';
import 'package:movie_app/movie/domain/entites/movie.dart';
import 'package:movie_app/movie/domain/entites/movie_detail.dart';
import 'package:movie_app/movie/domain/entites/recommendation.dart';
import 'package:movie_app/movie/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_recommendations_usecase.dart';

import '../../../core/error/failure.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();

  Future<Either<Failure, MovieDetail>> getMovieDetail(
      MovieDetailParameteres parameteres);
  Future<Either<Failure, List<Recommendation>>> getRecommendations(
    RecommendationParameter parameters
  );
}

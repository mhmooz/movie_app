import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/baseUsecase.dart';
import 'package:movie_app/movie/domain/entites/movie_detail.dart';
import 'package:movie_app/movie/domain/repositories/base_movie_repositories.dart';

class GetMovieDetailUseCase extends BaseUsecase<MovieDetail, MovieDetailParameteres> {
  final BaseMovieRepository baseMovieRepository;
  GetMovieDetailUseCase(this.baseMovieRepository);
  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailParameteres parameteres) async {
    return await baseMovieRepository.getMovieDetail(parameteres);
  }
}

class MovieDetailParameteres extends Equatable {
  final int movieId;

 const MovieDetailParameteres({required this.movieId});

@override
List<Object?> get props => [movieId];
}

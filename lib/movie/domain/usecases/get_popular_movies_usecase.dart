import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/baseUsecase.dart';
import 'package:movie_app/movie/domain/repositories/base_movie_repositories.dart';

import '../../../core/error/failure.dart';
import '../entites/movie.dart';

class GetPopularMoviesUsecase extends BaseUsecase<List<Movie> , NoParameters> {
  final BaseMovieRepository baseMovieRepository;
  GetPopularMoviesUsecase(this.baseMovieRepository);

 @override
  Future<Either<Failure, List<Movie>>> call(NoParameters noParameters) async {
    return await baseMovieRepository.getPopularMovies();
  }
}

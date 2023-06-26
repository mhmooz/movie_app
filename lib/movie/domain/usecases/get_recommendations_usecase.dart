import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/core/usecase/baseUsecase.dart';
import 'package:movie_app/movie/domain/entites/recommendation.dart';
import 'package:movie_app/movie/domain/repositories/base_movie_repositories.dart';

class GetRecommendationsUsecase
    extends BaseUsecase<List<Recommendation>, RecommendationParameter> {
  final BaseMovieRepository baseMovieRepository;

  GetRecommendationsUsecase(this.baseMovieRepository);
  @override
  Future<Either<Failure,List<Recommendation>>> call(
      RecommendationParameter parameters) async {
    return await baseMovieRepository.getRecommendations(parameters);
  }
}

class RecommendationParameter extends Equatable {
  final int id;
  const RecommendationParameter(this.id);

  @override
  List<Object?> get props => [id];
}

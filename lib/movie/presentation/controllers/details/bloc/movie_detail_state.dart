import 'package:equatable/equatable.dart';
import 'package:movie_app/movie/domain/entites/recommendation.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../domain/entites/movie_detail.dart';

class MovieDetailState extends Equatable {
  MovieDetailState(
      { this.movieDetaileRquestState = RequestState.loading,
       this.movieDetailsMessage = '',
       this.recommendation = const[],
       this.recommendationRquestState = RequestState.loading,
       this.recommendationMessage = '',
      this.movieDetail});

  final MovieDetail? movieDetail;
  final RequestState movieDetaileRquestState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendation;
  final RequestState recommendationRquestState;
  final String recommendationMessage;

  MovieDetailState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetaileRquestState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendation,
    RequestState? recommendationRquestState,
    String? recommendationMessage,
  }) {
    return MovieDetailState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetaileRquestState:
          movieDetaileRquestState ?? this.movieDetaileRquestState,
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      recommendation: recommendation ?? this.recommendation,
      recommendationRquestState:
          recommendationRquestState ?? this.recommendationRquestState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  

@override
List<Object?> get props => [movieDetail, movieDetaileRquestState, movieDetailsMessage, recommendation, recommendationRquestState, recommendationMessage];
}

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_recommendations_usecase.dart';

import 'movie_detail_state.dart';

part 'movie_detail_event.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetailUseCase getMovieDetailUseCase;
  final GetRecommendationsUsecase getRecommendationsUsecase;
  MovieDetailBloc(this.getMovieDetailUseCase, this.getRecommendationsUsecase)
      : super(MovieDetailState()) {
    on<GetMovieDetailEvent>(_getMovieDetail);
    on<GetMovieRecommendationEvent>(_getMovieRecommendations);
  }

  FutureOr<void> _getMovieDetail(
      GetMovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    final result =
        await getMovieDetailUseCase(MovieDetailParameteres(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              movieDetaileRquestState: RequestState.error,
              movieDetailsMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetaileRquestState: RequestState.loaded,
              movieDetail: r,
            )));
  }

  FutureOr<void> _getMovieRecommendations(
      GetMovieRecommendationEvent event, Emitter<MovieDetailState> emit) async {
    final result =
        await getRecommendationsUsecase(RecommendationParameter(event.id));
    result.fold(
        (l) => emit(state.copyWith(
              recommendationRquestState: RequestState.error,
              recommendationMessage: l.message,
            )),
        (r) => 
        emit(state.copyWith(
          recommendationRquestState: RequestState.loaded,
          recommendation: r,
        ))
        );
  }
}

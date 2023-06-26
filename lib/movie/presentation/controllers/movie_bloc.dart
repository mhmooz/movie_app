import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/usecase/baseUsecase.dart';
import 'package:movie_app/core/utils/enums.dart';
import 'package:movie_app/movie/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movie/presentation/controllers/movie_event.dart';
import 'package:movie_app/movie/presentation/controllers/movie_states.dart';

class MovieBloc extends Bloc<MovieEvent, MovieStates> {
  final GetNowPlayingMovieUsecase getNowPlayingMovieUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  MovieBloc(
    this.getNowPlayingMovieUsecase,
    this.getPopularMoviesUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(MovieStates()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MovieStates> emit) async {
    final result = await getNowPlayingMovieUsecase(const NoParameters());
    emit(state.copyWith(
      nowPlayingState: RequestState.loading,
    ));
    result.fold(
      (l) => emit(state.copyWith(
        nowPlayingState: RequestState.error,
        nowPlayingMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        nowPlayingState: RequestState.loaded,
        nowPlayingMovies: r,
      )),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MovieStates> emit) async {
    final result = await getPopularMoviesUsecase(const NoParameters());
    emit(state.copyWith(popularMoviesState: RequestState.loading));
    result.fold(
        (l) => emit(state.copyWith(
              popularMoviesState: RequestState.error,
              popularMoviesMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              popularMoviesState: RequestState.loaded,
              popularMovies: r,
            )));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MovieStates> emit) async {
    final result = await getTopRatedMoviesUsecase(const NoParameters());
    emit(state.copyWith(topRatedMoviesState: RequestState.loading));
    result.fold(
        (l) => emit(state.copyWith(
              topRatedMoviesState: RequestState.error,
              topRatedMoviesMessage: l.message,
            )),
        (r) => emit(state.copyWith(
              topRatedMoviesState: RequestState.loaded,
              topRatedMovies: r,
            )));
  }
}

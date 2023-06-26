import 'package:get_it/get_it.dart';
import 'package:movie_app/movie/data/datasource/movie_remote_data_source.dart';
import 'package:movie_app/movie/data/repositories/movie_repository.dart';
import 'package:movie_app/movie/domain/repositories/base_movie_repositories.dart';
import 'package:movie_app/movie/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_now_playing_movie_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_recommendations_usecase.dart';
import 'package:movie_app/movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movie_app/movie/presentation/controllers/details/bloc/movie_detail_bloc.dart';
import 'package:movie_app/movie/presentation/controllers/movie_bloc.dart';

final sl = GetIt.instance;
class ServicesLocator {
  void init() {
    ///Bloc
    sl.registerFactory(() => MovieBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailBloc(sl(),sl()));

    ///UseCases
    sl.registerLazySingleton(() => GetNowPlayingMovieUsecase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetTopRatedMoviesUsecase(sl()));
    sl.registerLazySingleton(() => GetMovieDetailUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationsUsecase(sl()));

    ///Repository
    sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));

    ///Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}

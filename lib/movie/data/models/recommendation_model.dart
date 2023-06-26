import 'package:movie_app/movie/domain/entites/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({ super.backDropPath, required super.id});
  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backDropPath: json['backdrop_path']?? '/hZkgoQYus5vegHoetLkCJzb17zJ.jpg',
        id: json['id'],
      );
}

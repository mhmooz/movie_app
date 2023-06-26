import 'package:movie_app/movie/domain/entites/geners.dart';

class GenresModel extends Genres {
 const GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        id: json['id'],
        name: json['name'],
      );
}

import 'package:json_annotation/json_annotation.dart';

part 'movie_entity.g.dart';

@JsonSerializable()
class MovieEntity {

  @JsonKey(name: 'id')
  final int? id;

  @JsonKey(name: 'title')
  final String? title;

  @JsonKey(name: 'poster_path')
  final String? imageUrl;

  @JsonKey(name: 'vote_average')
  final double? rating;

  @JsonKey(name: 'overview')
  final String? overview;

  MovieEntity(this.id, this.title, this.imageUrl, this.rating,
      this.overview);

  factory MovieEntity.fromJson(Map<String, dynamic> json) =>
      _$MovieEntityFromJson(json);

  Map<String, dynamic> toJson() => _$MovieEntityToJson(this);
}
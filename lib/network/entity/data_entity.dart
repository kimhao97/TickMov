import 'package:json_annotation/json_annotation.dart';
import 'movie_entity.dart';

part 'data_entity.g.dart';

@JsonSerializable()
class DataEntity {

  @JsonKey(name: 'page')
  final int? page;

  @JsonKey(name: 'results')
  final List<MovieEntity> movies;

  @JsonKey(name: 'total_pages')
  final int? totalPages;

  @JsonKey(name: 'total_results')
  final int? totalResults;

  DataEntity(this.page, this.movies, this.totalPages, this.totalResults);

  factory DataEntity.fromJson(Map<String, dynamic> json) =>
      _$DataEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DataEntityToJson(this);
}
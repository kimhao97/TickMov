// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieEntity _$MovieEntityFromJson(Map<String, dynamic> json) => MovieEntity(
      json['id'] as int?,
      json['title'] as String?,
      json['poster_path'] as String?,
      (json['vote_average'] as num?)?.toDouble(),
      json['overview'] as String?,
    );

Map<String, dynamic> _$MovieEntityToJson(MovieEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'poster_path': instance.imageUrl,
      'vote_average': instance.rating,
      'overview': instance.overview,
    };

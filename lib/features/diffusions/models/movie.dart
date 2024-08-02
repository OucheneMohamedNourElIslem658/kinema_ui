import 'package:flutter/material.dart';

import 'diffusion.dart';

class Movie {
  int id;
  String title;
  String description;
  List<Type> type;
  String language;
  List<Actor> cast;
  double rate;
  String trailerURL;
  Duration duration;
  int voteCount;
  int trailerViews;
  String picURL;
  String po;
  List<Diffusion> diffusions;
  Color? selectColor;
  Color? backgroundColor;

  Movie({
    this.id = 0,
    this.title = "",
    this.description = "",
    this.type = const [],
    this.language = "",
    this.cast = const [],
    this.rate = 0.0,
    this.trailerURL = "",
    this.duration = Duration.zero,
    this.voteCount = 0,
    this.trailerViews = 0,
    this.picURL = "",
    this.po = "",
    this.diffusions = const [],
    this.selectColor,
    this.backgroundColor
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      description: json['description'] ?? "",
      type: (json['type'] as List<dynamic>?)
              ?.map((e) => Type.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      language: json['language'] ?? "",
      cast: (json['cast'] as List<dynamic>?)
              ?.map((e) => Actor.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      rate: (json['rate'] ?? 0.0).toDouble(),
      trailerURL: json['trailerURL'] ?? "",
      duration: Duration(microseconds: json['duration'] ?? 0),
      voteCount: json['voteCount'] ?? 0,
      trailerViews: json['trailerViews'] ?? 0,
      picURL: json['picURL'] ?? "",
      po: json['p_o'] ?? "",
      diffusions: (json['diffusions'] as List<dynamic>?)
              ?.map((e) => Diffusion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type.map((e) => e.toJson()).toList(),
      'language': language,
      'cast': cast.map((e) => e.toJson()).toList(),
      'rate': rate,
      'trailerURL': trailerURL,
      'duration': duration.inMicroseconds,
      'voteCount': voteCount,
      'trailerViews': trailerViews,
      'picURL': picURL,
      'p_o': po,
      'diffusions': diffusions.map((e) => e.toJson()).toList(),
    };
  }
}

class Type {
  int id;
  String name;
  List<Movie> movies;

  Type({
    this.id = 0,
    this.name = "",
    this.movies = const [],
  });

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      movies: (json['movies'] as List<dynamic>?)
              ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'movies': movies.map((e) => e.toJson()).toList(),
    };
  }
}

class Actor {
  int id;
  String name;
  String picURL;
  List<Movie> movies;

  Actor({
    this.id = 0,
    this.name = "",
    this.picURL = "",
    this.movies = const [],
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      id: json['id'] ?? 0,
      name: json['name'] ?? "",
      picURL: json['picURL'] ?? "",
      movies: (json['movies'] as List<dynamic>?)
              ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'picURL': picURL,
      'movies': movies.map((e) => e.toJson()).toList(),
    };
  }
}

class Trailer {
  final String title;
  final String trailerUrl;
  late final String thumbnailUrl;
  final bool isOriginal;

  Trailer({
    required this.title,
    required this.trailerUrl,
    required this.isOriginal
  }) {
    thumbnailUrl = getYouTubeThumbnailUrl(trailerUrl);
  }

  String getYouTubeThumbnailUrl(String url, {String quality = 'hqdefault'}) {
    final Uri uri = Uri.parse(url);
    String? videoId;

    if (uri.host == 'youtu.be') {
      videoId = uri.pathSegments.first;
    } else if (uri.host == 'www.youtube.com' || uri.host == 'youtube.com') {
      videoId = uri.queryParameters['v'];
    }

    if (videoId == null || videoId.isEmpty) {
      throw ArgumentError('Invalid YouTube URL');
    }

    return 'https://img.youtube.com/vi/$videoId/$quality.jpg';
  }
}

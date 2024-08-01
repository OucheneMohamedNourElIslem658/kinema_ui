import 'package:flutter/material.dart';

class Movie {
  final String title;
  final String posterUrl;
  final List<String> genres;
  final Color selectColor;
  final Color backgroundColor;
  final Trailer trailer;

  Movie({
    required this.title,
    required this.posterUrl,
    required this.genres,
    required this.selectColor,
    required this.backgroundColor,
    required this.trailer
  });
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

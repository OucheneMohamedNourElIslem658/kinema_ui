import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kinema/features/event/controllers/event.dart';
import 'package:kinema/features/program/repositories/program.dart';
import 'package:kinema/commun/models/movie.dart';
import 'package:video_player/video_player.dart';

class ProgramController extends GetxController {

  final _programRepo = ProgramRepo();
  List<Movie> movies = [];
  final eventController = Get.put(EventController());

  Future<void> getProgram() async {
    movies = (await _programRepo.getMovies()) ?? [];
    update();
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getProgram();
      await initVideoPlayerForEachVideo();
      await eventController.getEvents();
    });
    super.onInit();
  }

  List<Map<String, Object>> trailers = [];

  Future<void> initVideoPlayerForEachVideo() async {
    for (var i = 0; i < movies.length; i++) {
      trailers.add({'movie': movies[i]});
    }
    for (var i = 0; i < trailers.length; i++) {
      final videoPlayerController = VideoPlayerController
          //change the url to the movies.videoURL
          .networkUrl(Uri.parse(
              'https://firebasestorage.googleapis.com/v0/b/fir-methods-9cc92.appspot.com/o/The%20Fast%20and%20the%20Furious%20Official%20Trailer%20%231%20-%20(2001)%20HD.mp4?alt=media&token=e413bcbc-9657-40d1-9f8f-7c72eced158d'))
        ..initialize().then((_) => update());
      trailers[i]['controller'] = videoPlayerController;
    }
    update();
  }

  Future<void> disposeVideoPlayerForEachVideo() async {
    for (var i = 0; i < movies.length; i++) {
      trailers.add({'movie': movies[i]});
    }
    for (var i = 0; i < trailers.length; i++) {
      await (trailers[i]['controller'] as VideoPlayerController).dispose();
    }
    update();
  }

  @override
  void dispose() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await disposeVideoPlayerForEachVideo();
    });
    super.dispose();
  }
}
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../commun/constents/movies_list.dart';

class PopularTrailersController extends GetxController {
    final List<Map<String,Object>> trailers = [];

  Future<void> initVideoPlayerForEachVideo() async {
    for (var i = 0; i < program.length; i++) {
      trailers.add({
        'movie': program[i]
      });
      update();
    }
    for (var i = 0; i < trailers.length; i++) {
      final videoPlayerController = VideoPlayerController
      //change the url to the movies.videoURL
      .networkUrl(Uri.parse('https://firebasestorage.googleapis.com/v0/b/fir-methods-9cc92.appspot.com/o/Rebel%20Moon%20-%20Part%20Two_%20The%20Scargiver%20_%20Official%20Teaser%20_%20Netflix.mp4?alt=media&token=feebfa58-56b5-489c-ac10-ed575aa8a554'))
      ..initialize().then((_) => update());
      trailers[i]['controller'] = videoPlayerController;
    }
  }
  
  @override
  void onInit() async {
    await initVideoPlayerForEachVideo();
    super.onInit();
  }
}
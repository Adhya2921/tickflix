import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class MovieController extends GetxController {
  late VideoPlayerController videoController;

  // Method to initialize the video player
  void initializeVideo(String url) {
    videoController = VideoPlayerController.asset(url)
      ..initialize().then((_) {
        update(); // Update UI when initialization is complete
      });
  }

  // Method to play the video
  void playVideo() {
    videoController.play();
  }

  // Method to pause the video
  void pauseVideo() {
    videoController.pause();
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}

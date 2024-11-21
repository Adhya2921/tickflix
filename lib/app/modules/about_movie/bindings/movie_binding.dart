// movie_binding.dart
import 'package:get/get.dart';
import '../controllers/movie_controller.dart';

class AboutMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieController>(() => MovieController());
  }
}

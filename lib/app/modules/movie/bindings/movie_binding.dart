import 'package:get/get.dart';

import '../controllers/movie_detail_controller.dart';

class MovieBinding extends  Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MovieDetailController());
  }
  
}
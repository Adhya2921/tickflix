import 'package:get/get.dart';
import '../controllers/speech_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpeechController>(() => SpeechController());
  }
}

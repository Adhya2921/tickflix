import 'package:get/get.dart';
import '../controller/speaker_controller.dart';

class SpeakerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpeakerController>(() => SpeakerController());
  }
}

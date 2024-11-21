import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechController extends GetxController {
  var isListening = false.obs; // Status mikrofon
  var speechText = ''.obs; // Hasil suara menjadi teks

  final SpeechToText _speechToText = SpeechToText();

  // Inisialisasi speech-to-text
  Future<void> initSpeech() async {
    try {
      bool available = await _speechToText.initialize(
        onStatus: (status) => print("Speech Status: $status"), // Debug status
        onError: (error) => print("Speech Error: $error"), // Debug error
      );

      if (!available) {
        Get.snackbar("Error", "Speech recognition is not available on this device.");
        print("Speech recognition is not available.");
      } else {
        print("Speech recognition initialized successfully.");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to initialize speech-to-text.");
      print("Error initializing speech-to-text: $e");
    }
  }

  // Mulai mendengarkan
  void startListening() async {
    if (!_speechToText.isAvailable) {
      print("Speech-to-Text is not available.");
      Get.snackbar("Error", "Speech-to-Text is not available on this device.");
      return;
    }

    isListening.value = true;
    speechText.value = ''; // Reset teks

    await _speechToText.listen(
      onResult: (result) {
        speechText.value = result.recognizedWords;
        print("Recognized Words: ${result.recognizedWords}");
      },
    );
  }

  // Hentikan mendengarkan
  void stopListening() async {
    isListening.value = false;
    await _speechToText.stop();
    print("Stopped listening.");
  }

  @override
  void onInit() {
    super.onInit();
    initSpeech();
  }
}

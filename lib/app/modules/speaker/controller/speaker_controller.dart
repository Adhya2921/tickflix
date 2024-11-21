import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class SpeakerController extends GetxController {
  final player = AudioPlayer(); // Pemutar audio
  var playlist = <String>[].obs; // Daftar lagu dari assets
  var currentAudio = ''.obs; // Lagu saat ini
  var isPlaying = false.obs; // Status apakah audio sedang diputar

  @override
  void onInit() {
    super.onInit();
    loadPlaylist(); // Muat daftar lagu saat controller diinisialisasi
  }

  // Memuat daftar lagu dari assets
  Future<void> loadPlaylist() async {
    try {
      // Muat daftar file lagu secara manual (atau gunakan dynamic asset loader jika banyak file)
      playlist.value = [
        'assets/Alan Silvestri - Portals (From Avengers_ EndgameAudio Only).mp3',
        'assets/32. The Real Hero (Avengers_ Endgame Soundtrack).mp3',
        'assets/audio/song3.mp3',
      ];
    } catch (e) {
      Get.snackbar('Error', 'Failed to load playlist: $e');
    }
  }

    final Map<String, String> audioTitles = {
        'Alan Silvestri - Portals (From Avengers_ EndgameAudio Only).mp3': 'Portals (Avengers Endgame)',
        '32. The Real Hero (Avengers_ Endgame Soundtrack).mp3': 'The Real Hero (Avengers Endgame)',
        'ironman_theme.mp3': 'Ironman Theme',
      };


  // Memutar lagu
  Future<void> playAudio(String audioPath) async {
    try {
      await player.setAsset(audioPath); // Muat file dari assets
      currentAudio.value = audioPath;
      await player.play(); // Mulai pemutaran
      isPlaying.value = true;
    } catch (e) {
      Get.snackbar('Error', 'Failed to play audio: $e');
    }
  }

  // Pause lagu
  Future<void> pauseAudio() async {
    await player.pause();
    isPlaying.value = false;
  }

  // Mengganti lagu
  Future<void> changeAudio(String audioPath) async {
    await player.stop();
    await playAudio(audioPath);
  }

  @override
  void onClose() {
    player.dispose(); // Hapus instansi pemutar
    super.onClose();
  }
}

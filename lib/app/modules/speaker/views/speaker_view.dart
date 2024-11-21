import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/speaker_controller.dart';

class SpeakerView extends StatelessWidget {
  final SpeakerController controller = Get.put(SpeakerController());

  SpeakerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MOVIE SOUNDTRACKS'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 149, 25, 17), // Mengubah warna AppBar menjadi merah
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 154, 11, 11), // Gradasi warna merah
              Color.fromARGB(255, 224, 21, 18),
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Obx(() {
              return Text(
                'Current Soundtrack: ${controller.currentAudio.value.isEmpty ? 'None' : controller.audioTitles[controller.currentAudio.value.split('/').last]}',
                style: const TextStyle(fontSize: 18, color: Colors.white), // Mengubah warna teks menjadi putih
                textAlign: TextAlign.center,
              );
            }),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.isPlaying.value) {
                return ElevatedButton.icon(
                  onPressed: controller.pauseAudio,
                  icon: const Icon(Icons.pause),
                  label: const Text('Pause'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 96, 7, 7), // Warna teks tombol
                  ),
                );
              } else if (controller.currentAudio.isNotEmpty) {
                return ElevatedButton.icon(
                  onPressed: () => controller.playAudio(controller.currentAudio.value),
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('Resume'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.red.shade700, // Warna teks tombol
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.playlist.length,
                  itemBuilder: (context, index) {
                    final audioPath = controller.playlist[index];
                    final audioTitle = controller.audioTitles[audioPath.split('/').last] ?? 'Unknown Title'; // Ambil judul dari map

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.red.shade200, // Gradasi pada item list
                            Colors.red.shade100,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(audioTitle, style: const TextStyle(color: Colors.white)), // Menampilkan judul yang disesuaikan
                        onTap: () => controller.changeAudio(audioPath),
                        trailing: controller.currentAudio.value == audioPath
                            ? const Icon(Icons.play_circle, color: Colors.green)
                            : null,
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

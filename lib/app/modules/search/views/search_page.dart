import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;  // Import speech_to_text

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final stt.SpeechToText _speechToText = stt.SpeechToText();  // Instance dari SpeechToText
  bool _isListening = false;
  String _speechText = "Press the microphone to start speaking";  // Teks hasil speech

  final TextEditingController _controller = TextEditingController();  // Add a TextEditingController

  @override
  void initState() {
    super.initState();
    _initSpeech();  // Inisialisasi pengenalan suara
  }

  // Fungsi inisialisasi speech recognition
  Future<void> _initSpeech() async {
    bool available = await _speechToText.initialize();
    if (!available) {
      setState(() {
        _speechText = "Speech to text not available on this device";
      });
    }
  }

  // Fungsi untuk mulai mendengarkan suara
  void _startListening() async {
    await _speechToText.listen(onResult: (result) {
      setState(() {
        _speechText = result.recognizedWords;
        _controller.text = _speechText; // Update the TextField with the speech result
      });
    });
    setState(() {
      _isListening = true;
    });
  }

  // Fungsi untuk berhenti mendengarkan suara
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {
      _isListening = false;
    });
  }

  // Daftar film yang lebih panjang sebagai contoh
  List<String> movieList = [
    "Inception",
    "The Dark Knight",
    "Interstellar",
    "Avatar",
    "Avengers: Endgame",
    "Titanic",
    "The Lion King",
    "Spider-Man: No Way Home",
    "The Matrix",
    "The Shawshank Redemption",
    "The Godfather",
    "Pulp Fiction",
    "Forrest Gump",
    "The Avengers",
    "Gladiator",
    "Star Wars: A New Hope",
    "Jurassic Park",
    "The Prestige",
    "Frozen",
    "Black Panther",
    "Wonder Woman",
    "Guardians of the Galaxy",
    "The Hunger Games",
    "The Wolf of Wall Street",
    "Mad Max: Fury Road",
    "The Social Network"
  ];

  // Mencari film yang sesuai dengan teks
  List<String> searchMovies(String query) {
    return movieList
        .where((movie) => movie.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Warna utama menggunakan kode 0xFFB22222
  Color customRed = const Color(0xFFB22222);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Search with Microphone",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: customRed,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Background Image dari Network
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1518709263802-e4b07816ebc5'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Pencarian dengan text field biasa dan tombol mikrofon di sampingnya
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _controller, // Bind the TextField to the controller
                              onChanged: (query) {
                                setState(() {
                                  _speechText = query;
                                });
                              },
                              decoration: InputDecoration(
                                labelText: "Search Movie",
                                hintText: "Enter movie name",
                                prefixIcon: Icon(Icons.search, color: customRed),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(color: customRed),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10), // Spasi antara text field dan mikrofon
                          GestureDetector(
                            onTap: _isListening ? _stopListening : _startListening,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: _isListening ? 50 : 45,
                              width: _isListening ? 50 : 45,
                              decoration: BoxDecoration(
                                color: _isListening
                                    ? customRed
                                    : customRed.withOpacity(0.8),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: customRed.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Icon(
                                _isListening ? Icons.mic : Icons.mic_none,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      // Hasil pengenalan suara
                      Text(
                        _speechText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      const SizedBox(height: 30),
                      // Menampilkan hasil pencarian film secara vertikal
                      SizedBox(
                        height: 300,  // Membatasi tinggi area hasil pencarian
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: searchMovies(_speechText).length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 4,
                                color: customRed.withOpacity(0.2), // Kartu dengan latar belakang merah muda
                                child: ListTile(
                                  title: Text(
                                    searchMovies(_speechText)[index],
                                    style: const TextStyle(fontSize: 18, color: Colors.black),
                                  ),
                                  leading: Icon(Icons.movie, color: customRed), // Ikon film merah
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

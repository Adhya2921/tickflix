import 'package:flutter/material.dart';
import 'package:myapp/app/modules/authorization/login_page.dart';
import 'package:myapp/app/modules/authorization/register_page.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image that covers the entire screen
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://cdn0-production-images-kly.akamaized.net/36LdECrTOiiGt13K1UR6K_lLvx4=/800x1066/smart/filters:quality(75):strip_icc():format(webp)/kly-media-production/medias/3079617/original/085141800_1584514176-Black_Widow.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Dark overlay on top of the background image
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Column(
            children: [
              const Spacer(flex: 12), // Push the content lower on the screen

              // TICKFLIX title
              const Center(
                child: Text(
                  'TICKFLIX',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontFamily: 'Krona One',
                    letterSpacing: 3.12,
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space between title and subtitle

              // Subtitle
              const Center(
                child: Text(
                  'Get ready to dive into the greatest stories',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              const SizedBox(height: 50), // Space between subtitle and buttons

              // Get Started Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB22222),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                ),
                child: const Text('Get Started'),
              ),
              const SizedBox(height: 20), // Space between buttons

              // Sign In Button
              OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                  backgroundColor: const Color.fromARGB(255, 15, 15, 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 140, vertical: 20),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              const Spacer(flex: 2), // Bottom spacing
            ],
          ),
        ],
      ),
    );
  }
}

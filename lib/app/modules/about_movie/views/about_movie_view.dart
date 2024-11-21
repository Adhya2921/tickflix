// about_movie_view.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/home/views/home_view.dart';
import '../controllers/movie_controller.dart';

class AboutMovieView extends StatelessWidget {
  final MovieController controller = Get.put(MovieController());

   AboutMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: const [
          AboutMovie(),
        ]),
      ),
    );
  }
}

class AboutMovie extends StatelessWidget {
  const AboutMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 640,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Colors.black, Color(0xFFB22222)],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: -9,
                child: Stack(
                  children: [
                    // Background image
                    Container(
                      width: 360,
                      height: 276,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU7REiAViPA1vU6O7JLCP7DUviU58SWhUXUg&s'),
                          fit: BoxFit.cover,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3FB22222),
                            blurRadius: 50,
                            offset: Offset(0, 60),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                    ),
                    // Blur effect
                    BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 0.1, // Adjust the blur intensity
                        sigmaY: 0.1,
                      ),
                      child: Container(
                        width: 360,
                        height: 276,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(
                              0.3), // Optional: adds a frosted glass effect
                        ),
                      ),
                    ),
                    // Gradient overlay
                    Container(
                      width: 360,
                      height: 276,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 51, 22, 20).withOpacity(
                                0.5), // Adjust the opacity as needed
                            Colors.transparent,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: -35,
                top: 598,
                child: Container(
                  width: 430,
                  height: 47,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFFB22222), Colors.black],
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 18,
                top: 276,
                child: Text(
                  'AVENGERS “END GAME”',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
              Positioned(
                left: 18,
                top: 313.16,
                child: SizedBox(
                  width: 324.99,
                  height: 61.13,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 324.99,
                          height: 61.13,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 1,
                                offset: Offset(0, 0.50),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 21.83,
                        top: 11.83,
                        child: SizedBox(
                          width: 67.17,
                          height: 27.01,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 20.21,
                                  height: 16.43,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                ),
                              ),
                              Positioned(
                                left: 21.83,
                                top: 4.60,
                                child: SizedBox(
                                  width: 24.25,
                                  height: 9.86,
                                  child: Text(
                                    'Price',
                                    style: TextStyle(
                                      color: Colors.black
                                          .withOpacity(0.7699999809265137),
                                      fontSize: 10,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 1.17,
                                top: 15.01,
                                child: SizedBox(
                                  width: 66,
                                  height: 12,
                                  child: Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '4,99',
                                          style: TextStyle(
                                            color: Color(0xFFB22222),
                                            fontSize: 12,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' ',
                                          style: TextStyle(
                                            color: Color(0xFFB22222),
                                            fontSize: 16,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'USD',
                                          style: TextStyle(
                                            color: Color(0xFF9F9F9F),
                                            fontSize: 8,
                                            fontFamily: 'Roboto',
                                            fontWeight: FontWeight.w500,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 130.16,
                        top: 15.77,
                        child: SizedBox(
                          width: 63.87,
                          height: 26.29,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 24.25,
                                top: 0.66,
                                child: SizedBox(
                                  width: 21.83,
                                  height: 9.86,
                                  child: Text(
                                    'Date',
                                    style: TextStyle(
                                      color: Colors.black
                                          .withOpacity(0.7699999809265137),
                                      fontSize: 10,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 0,
                                top: 13.80,
                                child: SizedBox(
                                  width: 63.87,
                                  height: 12.49,
                                  child: Text(
                                    'Apr 24 - 30',
                                    style: TextStyle(
                                      color: Color(0xFFB22222),
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 8.08,
                                top: 0,
                                child: Container(
                                  width: 13.74,
                                  height: 11.17,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 248.19,
                        top: 16.43,
                        child: SizedBox(
                          width: 59.02,
                          height: 25.63,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 17.79,
                                top: 0,
                                child: SizedBox(
                                  width: 41.23,
                                  height: 9.86,
                                  child: Text(
                                    'Location',
                                    style: TextStyle(
                                      color: Colors.black
                                          .withOpacity(0.7699999809265137),
                                      fontSize: 10,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                left: 9.70,
                                top: 13.15,
                                child: SizedBox(
                                  width: 44.46,
                                  height: 12.49,
                                  child: Text(
                                    'Cinema',
                                    style: TextStyle(
                                      color: Color(0xFFB22222),
                                      fontSize: 12,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: -0,
                                top: 0.66,
                                child: Container(
                                  width: 12.94,
                                  height: 10.52,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 90.55,
                        top: 9.20,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(1.55),
                          child: Container(
                            width: 44.05,
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0x6B030205),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 224.75,
                        top: 9.20,
                        child: Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(1.55),
                          child: Container(
                            width: 44.05,
                            decoration: const ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0x6B030205),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 30,
                top: 400, // Posisi di atas Positioned sebelumnya
                child: SizedBox(
                  width: 300, // Sesuaikan lebar sesuai kebutuhan
                  height: 400, // Sesuaikan tinggi sesuai kebutuhan
                  child: Text(
                    'Avengers: Endgame (2019) is the epic conclusion to the Marvel Cinematic Universe’s (MCU) "Infinity Saga." The movie picks up after the devastating events of Avengers: Infinity War (2018), where Thanos successfully gathered all the Infinity Stones and wiped out half of all life in the universe with a single snap.',
                    style: TextStyle(
                      color: Color.fromARGB(
                          255, 255, 255, 255), // Warna teks
                      fontSize: 14, // Ukuran teks
                      fontWeight: FontWeight.bold, // Tebal teks
                    ),
                    textAlign: TextAlign.justify, // Posisikan teks di tengah
                  ),
                ),
              ),
              Positioned(
                left: 7,
                top: 577,
                child: SizedBox(
                  width: 45,
                  height: 45,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: const ShapeDecoration(
                            color: Colors.white,
                            shape: OvalBorder(),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 1,
                                offset: Offset(0, 0.50),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 9.34,
                        top: 9.34,
                        child: Container(
                          width: 26.32,
                          height: 26.32,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: const Icon(
                            Icons.favorite_border,
                            color: Color.fromARGB(
                                255, 68, 68, 68), // Set the desired color
                            size: 24,
                          ), // Set the desired size
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 83,
                top: 577,
                child: SizedBox(
                  width: 260,
                  height: 47,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 260,
                          height: 45,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 1,
                                offset: Offset(0, 0.50),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 0,
                        top: 14,
                        child: SizedBox(
                          width: 260,
                          height: 33,
                          child: Text(
                            'Get Ticket',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFB22222),
                              fontSize: 14,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
             
              Positioned(
                left: 13,
                top: 24,
                child: SizedBox(
                  width: 34,
                  height: 34,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 34,
                          height: 34,
                          decoration: const ShapeDecoration(
                            color: Color(0xE548454B),
                            shape: OvalBorder(),
                            shadows: [
                              BoxShadow(
                                color: Color(0x3F000000),
                                blurRadius: 1,
                                offset: Offset(0, 0.50),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 0,
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeView()),
                            );
                          },
                          child: const SizedBox(
                            width:
                                40, // Set the width of the container to fit the icon
                            height:
                                40, // Set the height of the container to fit the icon
                            child: Icon(
                              Icons.arrow_back, // Back arrow icon
                              color: Colors
                                  .white, // Set the color of the icon (white in this case)
                              size: 24, // Set the size of the icon
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}

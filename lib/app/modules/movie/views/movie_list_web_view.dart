// import 'package:flutter/material.dart';

// import '../../../data/models/movie_model.dart';

// class MovieListWebView extends StatelessWidget {
//   final MoviePopuler moviePopuler;

//   const MovieListWebView({super.key, required this.moviePopuler, required movieId});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Popular Movies'),
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 3, // Adjust for web view
//           childAspectRatio: 0.7,
//         ),
//         itemCount: moviePopuler.results.length,
//         itemBuilder: (context, index) {
//           final movie = moviePopuler.results[index];
//           return Card(
//             child: Column(
//               children: [
//                 Expanded(
//                   // ignore: unnecessary_null_comparison
//                   child: movie.posterPath != null
//                       ? Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}', fit: BoxFit.cover)
//                       : Container(),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     movie.title,
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Text(movie.releaseDate.toLocal().toString().split(' ')[0]), // Format release date
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

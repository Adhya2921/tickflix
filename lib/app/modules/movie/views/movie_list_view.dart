// import 'package:flutter/material.dart';

// import '../../../data/models/movie_model.dart';

// class MovieListView extends StatelessWidget {
//   final MoviePopuler moviePopuler;

//   const MovieListView({super.key, required this.moviePopuler});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Popular Movies'),
//       ),
//       body: ListView.builder(
//         itemCount: moviePopuler.results.length,
//         itemBuilder: (context, index) {
//           final movie = moviePopuler.results[index];
//           return Card(
//             child: ListTile(
//               // ignore: unnecessary_null_comparison
//               leading: movie.posterPath != null
//                   ? Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}')
//                   : null,
//               title: Text(movie.title),
//               subtitle: Text(movie.releaseDate.toLocal().toString().split(' ')[0]), // Format release date
//               onTap: () {
//                 // Handle on tap
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => MovieDetailView(movie: movie),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class MovieDetailView extends StatelessWidget {
//   final Result movie;

//   const MovieDetailView({super.key, required this.movie});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(movie.title),
//       ),
//       body: Column(
//         children: [
//           movie.backdropPath != null
//               ? Image.network('https://image.tmdb.org/t/p/w500${movie.backdropPath}')
//               : Container(),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(movie.overview),
//           ),
//         ],
//       ),
//     );
//   }
// }

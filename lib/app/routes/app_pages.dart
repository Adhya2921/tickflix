import 'package:get/get.dart';
import 'package:myapp/app/modules/search/bindings/search_binding.dart';
import 'package:myapp/app/modules/search/views/search_page.dart';
import 'package:myapp/app/modules/speaker/views/speaker_view.dart';

// import '../modules/movie/views/movie_list_web_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/about_movie/bindings/movie_binding.dart';
import '../modules/about_movie/views/about_movie_view.dart';
// import '../modules/movie/bindings/movie_binding.dart';
// import '../modules/movie/views/movie_list_view.dart';
import '../modules/speaker/binding/speaker_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.WELCOME,
      page: () => const WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.ABOUTMOVIE,
      page: () => AboutMovieView(),
      binding: AboutMovieBinding(),
    ),
    //  GetPage(
    //   name: _Paths.MOVIELIST,
    //   page: () => MovieListView(moviePopuler: Get.arguments,),
    //   binding: MovieBinding(),
    // ),
    // GetPage(
    //   name: _Paths.MOVIEWEB,
    //   page: () => MovieListWebView(movieId: Get.arguments, moviePopuler: Get.arguments,),
    //   binding: MovieBinding(),
    // ),
     GetPage(
      name: _Paths.SEARCHMOVIE,
      page: () => const SearchPage(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.SPEAKER,
      page: () => SpeakerView(),
      binding: SpeakerBinding(),
      )
  ];
}

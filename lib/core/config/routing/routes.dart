import 'package:auto_route/auto_route.dart';
import 'package:flutter_movies_app/ui/pages/movie_details/movie_details_page.dart';
import 'package:flutter_movies_app/ui/pages/now_playing_movies/now_playing_movies_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: NowPlayingMoviesPage, initial: true),
    AutoRoute(page: MovieDetailsPage),
  ],
)
class $AppRouter {}

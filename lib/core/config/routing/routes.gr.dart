// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:flutter_movies_app/ui/pages/movie_details/movie_details_page.dart'
    as _i2;
import 'package:flutter_movies_app/ui/pages/now_playing_movies/now_playing_movies_page.dart'
    as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    NowPlayingMoviesRoute.name: (routeData) {
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.NowPlayingMoviesPage());
    },
    MovieDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailsRouteArgs>();
      return _i3.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.MovieDetailsPage(key: args.key, movieId: args.movieId));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(NowPlayingMoviesRoute.name, path: '/'),
        _i3.RouteConfig(MovieDetailsRoute.name, path: '/movie-details-page')
      ];
}

/// generated route for
/// [_i1.NowPlayingMoviesPage]
class NowPlayingMoviesRoute extends _i3.PageRouteInfo<void> {
  const NowPlayingMoviesRoute() : super(NowPlayingMoviesRoute.name, path: '/');

  static const String name = 'NowPlayingMoviesRoute';
}

/// generated route for
/// [_i2.MovieDetailsPage]
class MovieDetailsRoute extends _i3.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({_i4.Key? key, required int movieId})
      : super(MovieDetailsRoute.name,
            path: '/movie-details-page',
            args: MovieDetailsRouteArgs(key: key, movieId: movieId));

  static const String name = 'MovieDetailsRoute';
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({this.key, required this.movieId});

  final _i4.Key? key;

  final int movieId;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movieId: $movieId}';
  }
}

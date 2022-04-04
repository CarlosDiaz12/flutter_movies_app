// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:flutter_movies_app/ui/pages/favorite_movies/favorite_movies_page.dart'
    as _i3;
import 'package:flutter_movies_app/ui/pages/movie_details/movie_details_page.dart'
    as _i2;
import 'package:flutter_movies_app/ui/pages/now_playing_movies/now_playing_movies_page.dart'
    as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    NowPlayingMoviesRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.NowPlayingMoviesPage());
    },
    MovieDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailsRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.MovieDetailsPage(key: args.key, movieId: args.movieId));
    },
    FavoriteMoviesRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.FavoriteMoviesPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(NowPlayingMoviesRoute.name, path: '/'),
        _i4.RouteConfig(MovieDetailsRoute.name, path: '/movie-details-page'),
        _i4.RouteConfig(FavoriteMoviesRoute.name, path: '/favorite-movies-page')
      ];
}

/// generated route for
/// [_i1.NowPlayingMoviesPage]
class NowPlayingMoviesRoute extends _i4.PageRouteInfo<void> {
  const NowPlayingMoviesRoute() : super(NowPlayingMoviesRoute.name, path: '/');

  static const String name = 'NowPlayingMoviesRoute';
}

/// generated route for
/// [_i2.MovieDetailsPage]
class MovieDetailsRoute extends _i4.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({_i5.Key? key, required int movieId})
      : super(MovieDetailsRoute.name,
            path: '/movie-details-page',
            args: MovieDetailsRouteArgs(key: key, movieId: movieId));

  static const String name = 'MovieDetailsRoute';
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({this.key, required this.movieId});

  final _i5.Key? key;

  final int movieId;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movieId: $movieId}';
  }
}

/// generated route for
/// [_i3.FavoriteMoviesPage]
class FavoriteMoviesRoute extends _i4.PageRouteInfo<void> {
  const FavoriteMoviesRoute()
      : super(FavoriteMoviesRoute.name, path: '/favorite-movies-page');

  static const String name = 'FavoriteMoviesRoute';
}

import 'package:dio/dio.dart';
import 'package:flutter_movies_app/core/constants/remote_constants.dart';
import 'package:flutter_movies_app/data/local/local_dao.dart';
import 'package:flutter_movies_app/data/repository/movies_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjection {
  static List<SingleChildWidget> get providers => _providers;
  DependencyInjection();
  static List<SingleChildWidget> _providers = [];
  static final List<SingleChildWidget> _networkProviders = [
    Provider.value(value: _initHttpClient()),
    /*
    example:
        ProxyProvider<Dio, ExampleService>(
      update: (context, dioClient, _) => ExampleService(
        client: dioClient,
      ),
    ),
     */
  ];

  static final List<SingleChildWidget> _repositoryProviders = [
    ProxyProvider2<Dio, LocalDao, MoviesRepository>(
      update: (context, dioClient, localDao, _) =>
          MoviesRepository(client: dioClient, localDao: localDao),
    ),

    /*Provider.value(value: ExampleRepository),*/

    /*
    example:
        ProxyProvider<Dio, ExampleService>(
      update: (context, dioClient, _) => ExampleService(
        client: dioClient,
      ),
    ),
     */
  ];
/*
  static final List<SingleChildWidget> _uiProviders = [
    /*
    example:
        ProxyProvider<Dio, ExampleService>(
      update: (context, dioClient, _) => ExampleService(
        client: dioClient,
      ),
    ),
     */
  ];
*/
  static Future<void> setup() async {
    _providers = [...providers, ..._networkProviders, ..._repositoryProviders];
  }

  static Dio _initHttpClient() {
    var client = Dio(
      BaseOptions(
        baseUrl: RemoteConstants.API_URL_BASE,
      ),
    );
    return client;
  }

  static void loadSharedPref(SharedPreferences preferences) {
    _providers
        .add(Provider.value(value: LocalDao(sharedPreferences: preferences)));
  }
}

import 'package:dio/dio.dart';
import 'package:flutter_movies_app/data/repository/example_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class DependencyInjection {
  static List<SingleChildWidget> get providers => _providers;
  DependencyInjection._();
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
    Provider.value(value: ExampleRepository),

    /*
    example:
        ProxyProvider<Dio, ExampleService>(
      update: (context, dioClient, _) => ExampleService(
        client: dioClient,
      ),
    ),
     */
  ];

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

  static Future<void> setup() async {
    _providers = [..._networkProviders, ..._repositoryProviders];
  }

  static Dio _initHttpClient() {
    var client = Dio(
      BaseOptions(
        connectTimeout: 100000000,
        receiveTimeout: 100000000,
        // TODO: change later
        baseUrl: '',
      ),
    );
    return client;
  }
}

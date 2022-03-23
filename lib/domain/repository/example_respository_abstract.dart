import 'package:dartz/dartz.dart';

abstract class ExampleRepositoryAbstract {
  Future<Either<Exception, bool>> example();
}

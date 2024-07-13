import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class UseCase<Type> {
  Future<Either<Failures, Type>> call();
}

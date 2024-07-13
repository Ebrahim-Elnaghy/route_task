import 'package:dartz/dartz.dart';

import '../error/failures.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failures, Type>> call(Param param);
}

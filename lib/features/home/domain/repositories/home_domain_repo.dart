import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/product_entity.dart';

abstract class HomeDomainRepo {
  Future<Either<Failures, List<ProductEntity>>> getAllProducts();
}

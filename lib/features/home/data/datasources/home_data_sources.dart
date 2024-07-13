import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../models/product_model.dart';

abstract class HomeDataSources {
  Future<Either<Failures, List<ProductModel>>> getAllProducts();
}

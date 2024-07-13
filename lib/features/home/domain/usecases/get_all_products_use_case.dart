import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/no_param_use_case.dart';

import '../entities/product_entity.dart';
import '../repositories/home_domain_repo.dart';

@lazySingleton
class GetAllProductsUseCase implements UseCase<List<ProductEntity>> {
  HomeDomainRepo homeDomainRepo;
  GetAllProductsUseCase({
    required this.homeDomainRepo,
  });
  @override
  Future<Either<Failures, List<ProductEntity>>> call() =>
      homeDomainRepo.getAllProducts();
}

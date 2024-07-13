import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/server_failures.dart';
import '../../domain/repositories/home_domain_repo.dart';
import '../datasources/home_data_sources.dart';
import '../models/product_model.dart';

@LazySingleton(as: HomeDomainRepo)
class HomeDataRepo implements HomeDomainRepo {
  HomeDataSources homeDataSources;

  HomeDataRepo({required this.homeDataSources});

  @override
  Future<Either<Failures, List<ProductModel>>> getAllProducts() async {
    try {
      return homeDataSources.getAllProducts();
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailures.fromDioException(e));
      }
      return Left(ServerFailures(e.toString()));
    }
  }
}

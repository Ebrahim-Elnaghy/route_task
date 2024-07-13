import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/api_service.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/server_failures.dart';
import '../models/product_model.dart';
import 'home_data_sources.dart';

@LazySingleton(as: HomeDataSources)
class HomeRemoteDataSource implements HomeDataSources {
  final ApiService apiService;

  HomeRemoteDataSource({
    required this.apiService,
  });

  @override
  Future<Either<Failures, List<ProductModel>>> getAllProducts() async {
    try {
      var data = await apiService.get(endPoint: EndPoints.products);
      List<ProductModel> productList = parseProductData(data);
      return Right(productList);
    } catch (e) {
      return Left(ServerFailures(e.toString()));
    }
  }

  List<ProductModel> parseProductData(Map<String, dynamic> data) {
    List<ProductModel> productsList = [];
    for (var product in data['products']) {
      productsList.add(ProductModel.fromJson(product));
    }
    return productsList;
  }
}

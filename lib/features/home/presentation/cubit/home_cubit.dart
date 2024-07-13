import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/get_all_products_use_case.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeStates> {
  final GetAllProductsUseCase getAllProductsUseCase;

  HomeCubit({
    required this.getAllProductsUseCase,
  }) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<ProductEntity> allProducts = [];

  Future<void> getAllProducts() async {
    emit(HomeGetProductsLoadingState());

    var result = await getAllProductsUseCase.call();
    result.fold((l) {
      
      emit(HomeGetProductsErrorState(message: l.message));
    }, (r) {
      allProducts = r;
      emit(HomeGetProductsSuccessState());
    });
  }
}

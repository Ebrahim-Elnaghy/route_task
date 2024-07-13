part of 'home_cubit.dart';

abstract class HomeStates {}

class HomeInitial extends HomeStates {}

class HomeGetProductsLoadingState extends HomeStates {}

class HomeGetProductsSuccessState extends HomeStates {}

class HomeGetProductsErrorState extends HomeStates {
  String message;

  HomeGetProductsErrorState({
    required this.message,
  });
}

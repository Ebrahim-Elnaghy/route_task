
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
 final num?productID;
 final String? productName;
 final  num? productPrice;
 final String? productDescription;
 final  List<String>? productImages;
 final num? rate;

 const ProductEntity(
      {this.productID,
      this.productName,
      this.productPrice,
      this.productDescription,
      this.productImages,
      this.rate});

  @override
  List<Object?> get props => [productID, productName, productPrice, productDescription, productImages, rate];
}

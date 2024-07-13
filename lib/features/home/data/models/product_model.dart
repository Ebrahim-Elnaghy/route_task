
import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  final num? id;
  final String? title;
  final String? description;
  final num? price;
  final num? discountPercentage;
  final num? rating;
  final num? stock;
  final String? brand;
  final String? category;
  final String? thumbnail;
  final List<String>? images;

  const ProductModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  }) : super(
            productID: id,
            productName: title,
            productDescription: description,
            productPrice: price,
            productImages: images,
            rate: rating);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as num?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        price: json['price'] as num?,
        discountPercentage: (json['discountPercentage'] as num?),
        rating: (json['rating'] as num?),
        stock: json['stock'] as num?,
        brand: json['brand'] as String?,
        category: json['category'] as String?,
        thumbnail: json['thumbnail'] as String?,
        images: (json['images'] as List<dynamic>?)
            ?.map<String>((dynamic e) => e as String)
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'discountPercentage': discountPercentage,
        'rating': rating,
        'stock': stock,
        'brand': brand,
        'category': category,
        'thumbnail': thumbnail,
        'images': images,
      };
}

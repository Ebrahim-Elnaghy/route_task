import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../domain/entities/product_entity.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity productEntity;

  const ProductItem({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240.h,
      width: 158.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(width: 2.w, color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProductImage(),
          SizedBox(height: 8.h),
          _buildProductName(),
          SizedBox(height: 8.h),
          _buildProductPrice(),
          const Spacer(),
          _buildProductReviewAndAddButton(),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13.r),
          topRight: Radius.circular(13.r),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CachedNetworkImage(
            imageUrl: productEntity.productImages?[0] ?? "",
            width: 160.w,
            height: 128.h,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {},
            icon: Image.asset(AppImages.unselectFevIcon),
          )
        ],
      ),
    );
  }

  Widget _buildProductName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Text(
        productEntity.productName ?? '',
        style: GoogleFonts.poppins(
          color: const Color(0xff06004F),
          fontWeight: FontWeight.w400,
        ).copyWith(height: 1.1),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  Widget _buildProductPrice() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Text(
        'EGP ${productEntity.productPrice}',
        style: GoogleFonts.poppins(
          color: const Color(0xff06004F),
          fontWeight: FontWeight.w400,
        ).copyWith(height: 1.1),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  Widget _buildProductReviewAndAddButton() {
    return Padding(
      padding: EdgeInsets.only(left: 8.0.w, right: 5.w, bottom: 8.h),
      child: Row(
        children: [
          Text(
            'Review ',
            style: GoogleFonts.poppins(
              color: const Color(0xff06004F),
              fontWeight: FontWeight.w400,
            ).copyWith(height: 1.1),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          Text(
            '(${productEntity.rate}) ',
            style: GoogleFonts.poppins(
              color: const Color(0xff06004F),
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const Icon(
            Icons.star,
            color: Colors.amber,
            size: 15,
          ),
          const Spacer(),
          SizedBox(
            width: 30.w,
            height: 30.h,
            child: FloatingActionButton(
              heroTag: null,
              onPressed: () {},
              backgroundColor: AppColors.primary,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

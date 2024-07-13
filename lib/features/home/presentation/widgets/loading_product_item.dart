import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/utils/app_colors.dart';

class LoadingProductItem extends StatelessWidget {
  const LoadingProductItem({super.key});

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
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
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
            Container(
              width: 160.w,
              height: 128.h,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductName() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Container(
          width: double.infinity,
          height: 16.h,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildProductPrice() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: Container(
          width: double.infinity,
          height: 16.h,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildProductReviewAndAddButton() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: EdgeInsets.only(left: 8.0.w, right: 5.w, bottom: 8.h),
        child: Row(
          children: [
            Container(
              width: 50.w,
              height: 16.h,
              color: Colors.white,
            ),
            const Spacer(),
            Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r)),
            ),
          ],
        ),
      ),
    );
  }
}

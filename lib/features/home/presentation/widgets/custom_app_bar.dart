import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Image.asset(
          AppImages.routeLogoBlue,
          height: 22.h,
          width: 66.w,
        ),
        SizedBox(height: 16.h),
        _buildSearchBar(context),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: _buildInputDecoration(),
            onChanged: (keyword) {},
            onSubmitted: (keyword) {},
          ),
        ),
        SizedBox(width: 24.w),
        IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 16.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      hintText: 'What do you search for?',
      prefixIcon: const Icon(Icons.search),
      prefixIconColor: AppColors.primary,
    );
  }
}

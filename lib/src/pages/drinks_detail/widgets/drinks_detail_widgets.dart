import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/values/colors.dart';
import '../../../bloc/cart/bloc/cart_bloc.dart';
import '../../../models/drinks_model.dart';

Widget buildCustomBottomNavBar(int statePrice, DrinksModel drinks,
    BuildContext context, String selectedSize, int quantity) {
  return Container(
    width: double.infinity,
    height: 100.h,
    decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.botttomNavShadow.withOpacity(0.25),
            blurRadius: 24,
            spreadRadius: 0,
            offset: Offset(0, -10), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        border: Border.all(
            width: 2,
            color: AppColors.botttomNavBorder,
            strokeAlign: BorderSide.strokeAlignInside)),
    child: Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Price",
                style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 12.sp,
                    color: AppColors.subText),
              ),
              Text(
                statePrice == 0 ? "฿ ${drinks.price}" : "฿ $statePrice",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    color: AppColors.primaryElement),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => context
                .read<CartBloc>()
                .add(CartItemAddedEvent(drinks!.id, selectedSize, quantity)),
            child: Container(
              width: 217.w,
              height: 62.h,
              decoration: BoxDecoration(
                  color: AppColors.primaryElement,
                  borderRadius: BorderRadius.circular(16.r)),
              child: Center(
                child: Text(
                  "Add To Cart",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      color: AppColors.primaryBackground),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/values/colors.dart';
import '../../../bloc/cart/bloc/cart_bloc.dart';
import '../../../bloc/drinks_detail/drinks_detail_bloc.dart';
import '../../../models/drinks_model.dart';

class CustomBottomNavBar extends StatelessWidget {
  final DrinksModel? drinks;
  const CustomBottomNavBar({super.key, this.drinks});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrinksDetailBloc, DrinksDetailState>(
        builder: (context, state) {
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
                    state.price == 0
                        ? "฿ ${drinks!.price}"
                        : "฿ ${state.price}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: AppColors.primaryElement),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => context.read<CartBloc>().add(CartItemAddedEvent(
                    drinks!.id, state.selectedSize, state.quantity)),
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
    });
  }
}

Widget sizeOptionsContainer(
    String size, DrinksDetailState state, BuildContext context) {
  return GestureDetector(
    onTap: () {
      context.read<DrinksDetailBloc>().add(SelectSizeOptions(size));
    },
    child: Container(
      width: 85.w,
      height: 40.h,
      decoration: BoxDecoration(
          color: size == state.selectedSize
              ? AppColors.sizeBackground
              : Colors.white,
          border: Border.all(
            width: 1.5,
            color: size == state.selectedSize
                ? AppColors.primaryElement
                : AppColors.sizeBorder,
          ),
          borderRadius: BorderRadius.circular(12.r)),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14.sp,
            color: size == state.selectedSize
                ? AppColors.primaryElement
                : AppColors.firstText,
          ),
        ),
      ),
    ),
  );
}

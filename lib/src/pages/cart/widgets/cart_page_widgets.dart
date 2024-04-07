import 'package:coffee_shop_app/src/bloc/cart/bloc/cart_bloc.dart';
import 'package:coffee_shop_app/src/pages/edit_drink/edit_drink_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../common/values/colors.dart';
import '../../../bloc/user/bloc/user_bloc.dart';
import '../../../models/cart_items_response';

class UserInfoSection extends StatelessWidget {
  const UserInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(bottom: 10.h),
          width: double.infinity,
          height: 150.h,
          child: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Address',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Text(
                    state.user.name.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
                  child: Text(
                    state.user.address ?? 'Please edit your delivery address',
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 12.sp,
                        color: AppColors.addressText),
                  ),
                ),
                Container(
                  width: 120.w,
                  height: 27.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: AppColors.sizeBorder,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.edit_off,
                        size: 14,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        'Edit Address',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 12.sp,
                            color: AppColors.fifthText),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return Container(
        margin: EdgeInsets.all(25.dg),
        width: double.infinity,
        height: 200.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Summary',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  "฿ ${state.totalPrice}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Fee',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  'Free',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.h),
            Divider(height: 0.5, color: AppColors.divider),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Payment',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  "฿ ${state.totalPrice}",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

class CartItemsSection extends StatelessWidget {
  const CartItemsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return Container(
        margin: EdgeInsets.only(top: 30.h),
        width: double.infinity,
        child: Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: state.cartItems.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final item = state.cartItems[index];
              return itemContainer(item, context);
            },
          ),
        ),
      );
    });
  }

  Widget itemContainer(Datum item, BuildContext context) {
    {
      return SizedBox(
        width: 100.w,
        height: 130.h,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10.w),
                      clipBehavior: Clip.antiAlias,
                      width: 50.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Image.network(
                        item.img.toString(),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item.name.toString(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.firstText,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'with Chocolate',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300,
                            color: AppColors.subText,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 50.w,
                                height: 20.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                    color: AppColors.primaryElement,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    "SIZE " + item.size.toString(),
                                    style: TextStyle(
                                        color: AppColors.primaryElement),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "฿ " + item.totalPrice.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: EditDrinkPage(
                              drink: item,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Edit',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryElement),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Divider(height: 0.5, color: AppColors.divider),
          ],
        ),
      );
    }
  }
}

class CartBottomNavbar extends StatelessWidget {
  const CartBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return Container(
        width: double.infinity,
        height: 130.h,
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
            padding: EdgeInsets.only(top: 15.h, left: 25.w, right: 25.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/moneys.png',
                          width: 30,
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                width: 100.w,
                                height: 24.w,
                                decoration: BoxDecoration(
                                  color: AppColors.cashContainer,
                                  borderRadius: BorderRadius.circular(18.r),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(right: 5.w),
                                  child: Text(
                                    "฿ " + state.totalPrice.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                width: 50.w,
                                height: 24.w,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryElement,
                                  borderRadius: BorderRadius.circular(18.r),
                                ),
                                child: Center(
                                  child: Text(
                                    "Cash",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.sp,
                                        color: AppColors.primaryBackground),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/icons/Vector.png',
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.only(top: 10.h),
                    width: double.infinity,
                    height: 62.h,
                    decoration: BoxDecoration(
                        color: AppColors.primaryElement,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Center(
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: AppColors.primaryBackground),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      );
    });
  }
}

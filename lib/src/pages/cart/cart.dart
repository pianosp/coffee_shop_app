import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';
import 'widgets/cart_page_widgets.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(25.0),
          child: Container(
            color: AppColors.divider,
            height: 1.0,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 25.w, top: 20.h),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: AppColors.firstText,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Text(
            "My Order",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
          ),
        ),
      ),
      bottomNavigationBar: Container(
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
                                  padding: EdgeInsets.only(right: 15.w),
                                  child: Text(
                                    '฿20',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w),
              child: Column(
                children: [
                  userInfoSection(),
                  Divider(height: 0.5, color: AppColors.divider),
                  cartItems(),
                ],
              ),
            ),
            Divider(height: 0.5, color: AppColors.bigDivider, thickness: 4),
            paymentSection(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../common/values/colors.dart';

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

Widget userInfoSection() {
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
              'Name',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
            child: Text(
              '<address>',
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
                Icon(
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
}

Widget cartItems() {
  return Container(
    width: double.infinity,
    child: Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return itemContainer();
        },
      ),
    ),
  );
}

Widget itemContainer() {
  return Container(
    margin: EdgeInsets.only(top: 25.h),
    width: 100,
    height: 100,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 25.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10.w),
                    clipBehavior: Clip.antiAlias,
                    width: 44.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    child: Image.network(
                      "https://images.pexels.com/photos/305214/pexels-photo-305214.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Cappucino',
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
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.sizeBorder,
                      ),
                    ),
                    child: Icon(
                      Icons.remove,
                      size: 15,
                      color: AppColors.secondaryText,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    "1",
                    style: TextStyle(
                      color: AppColors.firstText,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Container(
                    width: 24.w,
                    height: 24.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.sizeBorder,
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 15,
                      color: AppColors.firstText,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 0.5,
          color: AppColors.divider,
        ),
      ],
    ),
  );
}

Widget paymentSection() {
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
              '฿50',
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
              '฿20',
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
              '฿20',
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
}

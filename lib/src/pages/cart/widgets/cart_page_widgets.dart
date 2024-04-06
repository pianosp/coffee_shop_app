import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/values/colors.dart';

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

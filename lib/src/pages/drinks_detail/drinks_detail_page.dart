import 'package:coffee_shop_app/common/values/colors.dart';
import 'package:coffee_shop_app/src/bloc/cart/bloc/cart_bloc.dart';
import 'package:coffee_shop_app/src/bloc/drinks_detail/drinks_detail_bloc.dart';
import 'package:coffee_shop_app/src/models/drinks_model.dart';
import 'package:coffee_shop_app/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/drinks_detail_widgets.dart';

class DrinksDetailPage extends StatefulWidget {
  final DrinksModel? drinks;

  const DrinksDetailPage({super.key, required this.drinks});

  @override
  State<DrinksDetailPage> createState() => _DrinksDetailPageState();
}

class _DrinksDetailPageState extends State<DrinksDetailPage> {
  @override
  Widget build(BuildContext context) {
    final drinks = widget.drinks;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
            "Detail",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        drinks: drinks,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 30.h),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40.h),
                clipBehavior: Clip.antiAlias,
                width: double.infinity,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Image.network(
                  drinks!.img,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                width: double.infinity,
                height: 100.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        drinks.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 22.sp,
                            color: AppColors.firstText),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Text(
                          "with Chocolate",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w200,
                            color: AppColors.subText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 0.5, color: AppColors.divider),
              Container(
                margin: EdgeInsets.only(top: 10.h),
                width: double.infinity,
                height: 100.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        "Description",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: AppColors.firstText),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk.",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w200,
                            color: AppColors.subText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 100.h,
                margin: EdgeInsets.only(bottom: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 13.w, top: 10.h),
                      child: Text(
                        "Size",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: AppColors.firstText),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
                      child: BlocBuilder<DrinksDetailBloc, DrinksDetailState>(
                        builder: (context, state) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              sizeOptionsContainer('S', state, context),
                              sizeOptionsContainer('M', state, context),
                              sizeOptionsContainer('L', state, context),
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Divider(height: 0.5, color: AppColors.divider),
              BlocBuilder<DrinksDetailBloc, DrinksDetailState>(
                builder: (context, state) {
                  return SizedBox(
                    width: double.infinity,
                    height: 60.h,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (state.quantity == 1) {
                              return;
                            } else {
                              context
                                  .read<DrinksDetailBloc>()
                                  .add(MinusQuantityCounter(drinks.price));
                            }
                          },
                          child: Container(
                            width: 30.w,
                            height: 30.h,
                            margin: EdgeInsets.only(bottom: 15.h),
                            child: Center(
                              child: Icon(
                                Icons.minimize_outlined,
                                color: AppColors.primaryElement,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 25),
                        Text(
                          state.quantity.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.sp),
                        ),
                        const SizedBox(width: 25),
                        GestureDetector(
                          onTap: () => context
                              .read<DrinksDetailBloc>()
                              .add(AddQuantityCounter(drinks.price)),
                          child: SizedBox(
                            width: 30.w,
                            height: 30.h,
                            child: Icon(
                              Icons.add,
                              color: AppColors.primaryElement,
                              size: 30,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              BlocListener<CartBloc, CartState>(
                listener: (context, state) {
                  if (state.cartAddedStatus == CartAddedStatus.success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Added to cart"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.popAndPushNamed(context, AppRoute.root);
                    context.read<CartBloc>().add(CartItemAddedClearState());
                  } else if (state.cartAddedStatus == CartAddedStatus.failure) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Failed to cart items"),
                      duration: Duration(seconds: 2),
                    ));
                  }
                },
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

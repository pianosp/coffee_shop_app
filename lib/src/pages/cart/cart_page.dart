import 'package:coffee_shop_app/src/bloc/cart/bloc/cart_bloc.dart';
import 'package:coffee_shop_app/src/bloc/user/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void initState() {
    context.read<CartBloc>().add(CartItemGetEvent());
    context.read<UserBloc>().add(UserFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state.cartItems.isEmpty) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(25.0),
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
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
                ),
              ),
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              child: Center(
                child: Text("Your Cart is Empty",
                    style: TextStyle(fontWeight: FontWeight.w600)),
              ),
            ),
          );
        } else {
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
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
                ),
              ),
            ),
            bottomNavigationBar: const CartBottomNavbar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      children: [
                        const UserInfoSection(),
                        Divider(height: 0.5, color: AppColors.divider),
                        const CartItemsSection(),
                      ],
                    ),
                  ),
                  Divider(
                      height: 0.5, color: AppColors.bigDivider, thickness: 4),
                  const PaymentSection(),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

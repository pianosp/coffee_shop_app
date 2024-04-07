import 'package:coffee_shop_app/src/bloc/edit_drink/edit_drink_bloc.dart';
import 'package:coffee_shop_app/src/models/cart_items_response';
import 'package:coffee_shop_app/src/pages/edit_drink/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

class EditDrinkPage extends StatefulWidget {
  final Datum drink;
  const EditDrinkPage({super.key, required this.drink});

  @override
  State<EditDrinkPage> createState() => _EditDrinkPageState();
}

class _EditDrinkPageState extends State<EditDrinkPage> {
  @override
  void initState() {
    final item = widget.drink;
    context.read<EditDrinkBloc>().add(FetchDrinkData(item));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.drink;
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
              item.name.toString(),
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.sp),
            ),
          ),
        ),
        bottomNavigationBar: EditDrinkBottomNavbar(
          item: item,
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
                    item.img.toString(),
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
                          item.name.toString(),
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
                      const SizeSelectOption(),
                    ],
                  ),
                ),
                Divider(height: 0.5, color: AppColors.divider),
                QuantitySection(item: item),
                const ShowSnackbarSection()
              ],
            ),
          ),
        ));
  }
}

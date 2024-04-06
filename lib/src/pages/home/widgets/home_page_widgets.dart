import 'package:coffee_shop_app/src/pages/cart/cart.dart';
import 'package:coffee_shop_app/src/pages/drinks_detail/drinks_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../common/values/colors.dart';
import '../../../bloc/drinks_detail/drinks_detail_bloc.dart';
import '../../../bloc/home/home_bloc.dart';
import '../../../models/drinks_model.dart';

Widget buildSearchField() {
  return Container(
      width: 320.w,
      height: 52.h,
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
        color: AppColors.backgroundTextField,
        borderRadius: BorderRadius.all(Radius.circular(16.w)),
      ),
      child: Row(
        children: [
          Container(
            width: 25.w,
            margin: EdgeInsets.only(left: 17.w),
            height: 25.h,
            child: Image.asset("assets/icons/search.png"),
          ),
          Container(
            width: 220.w,
            height: 50.h,
            child: TextField(
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: "Search coffee",
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle: TextStyle(color: AppColors.hintText),
              ),
              style: TextStyle(
                color: AppColors.primaryBackground,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
              ),
              autocorrect: false,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 6),
            width: 44.w,
            height: 44.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(Radius.circular(12.w)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SizedBox(
                width: 44.w,
                height: 44.h,
                child: Image.asset(
                  "assets/icons/filter2.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ));
}

Widget buildGridContainer(DrinksModel model, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeft,
              child: DrinksDetailPage(drinks: model)));
    },
    child: Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    model.img,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryText,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5.h),
                      child: Text(
                        "with Oat Milk",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w300,
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "฿ " + model.price.toString(),
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.fifthText,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          width: 32.w,
                          height: 32.h,
                          decoration: BoxDecoration(
                            color: AppColors.primaryElement,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.w),
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: AppColors.primaryBackground,
                              size: 18.w,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget drinkOptionsContainer(
    String drinkType, DrinksDetailState state, BuildContext context) {
  return GestureDetector(
    onTap: () {
      context.read<DrinksDetailBloc>().add(SelectDrinksOptions(drinkType));
      context.read<HomeBloc>().add(FilterDrinksList(drinkType));
    },
    child: Container(
      margin: EdgeInsets.only(right: 10.w),
      width: drinkType == 'Milk/Chocolate' || drinkType == 'Juice/Smoothies'
          ? 130.w
          : 90.w,
      height: 40.h,
      decoration: BoxDecoration(
          color: drinkType == state.selectedDrinks
              ? AppColors.primaryElement
              : Colors.white,
          borderRadius: BorderRadius.circular(12.r)),
      child: Center(
        child: Text(
          drinkType,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 14.sp,
            color: drinkType == state.selectedDrinks
                ? AppColors.primaryBackground
                : AppColors.firstText,
          ),
        ),
      ),
    ),
  );
}

Widget buildFloatingBtn(int badge, BuildContext context) {
  return Container(
    child: FittedBox(
      child: Stack(
        alignment: Alignment(0.6, -0.6),
        children: [
          FloatingActionButton(
            // Your actual Fab
            onPressed: () => Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft, child: CartPage())),
            backgroundColor: AppColors.primaryElement,
            child: Icon(
              Icons.shopping_cart,
              color: AppColors.primaryBackground,
              size: 30,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(),
          ),
          Container(
            // This is your Badge
            child: Center(
              // Here you can put whatever content you want inside your Badge
              child: Text(
                badge.toString(),
                style: TextStyle(
                  color: AppColors.primaryElement,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            constraints: BoxConstraints(minHeight: 20, minWidth: 20),
            decoration: BoxDecoration(
              // This controls the shadow
              boxShadow: [
                BoxShadow(
                    spreadRadius: 1,
                    blurRadius: 5,
                    color: Colors.black.withAlpha(50))
              ],
              borderRadius: BorderRadius.circular(16),
              color: AppColors
                  .primaryBackground, // This would be color of the Badge
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildGridViewDrinks(
  List tempDrinksList,
  List drinksList,
) {
  return GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 40,
      mainAxisSpacing: 20,
      childAspectRatio: 0.65,
    ),
    shrinkWrap: true,
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
    itemCount:
        tempDrinksList.isEmpty ? drinksList.length : tempDrinksList.length,
    itemBuilder: (context, index) {
      if (tempDrinksList.isNotEmpty) {
        final filterDrinks = tempDrinksList[index];
        return buildGridContainer(filterDrinks, context);
      } else {
        final drink = drinksList[index];
        return buildGridContainer(drink, context);
      }
    },
  );
}

Widget buildHeaderSection() {
  return Container(
    width: double.infinity,
    height: 230.h,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Color(0xFF313131), // Bottom left color
          Color(0xFF131313), // Top right color
        ],
      ),
    ),
    child: Container(
      margin: EdgeInsets.only(top: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w300,
                        color: AppColors.fouthText,
                      ),
                    ),
                    Text(
                      "RigbetelLabs, Pune",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.thirdText,
                      ),
                    ),
                  ],
                ),
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: 44.w,
                  height: 44.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Image.asset("assets/images/profile.jpg"),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          buildSearchField(),
        ],
      ),
    ),
  );
}

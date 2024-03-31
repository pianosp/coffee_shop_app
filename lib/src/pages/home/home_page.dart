import 'package:coffee_shop_app/src/bloc/drinks_detail/drinks_detail_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';
import '../../bloc/home/home_bloc.dart';
import '../../service/api_repository.dart';
import 'widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiRepository apiRepository = ApiRepository();
  @override
  void initState() {
    context.read<HomeBloc>().add(GetAllDrinksList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
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
            ),
            BlocBuilder<DrinksDetailBloc, DrinksDetailState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, top: 15),
                    child: Row(
                      children: [
                        drinkOptionsContainer('All', state, context),
                        drinkOptionsContainer('Coffee', state, context),
                        drinkOptionsContainer('Tea', state, context),
                        drinkOptionsContainer('Milk/Chocolate', state, context),
                        drinkOptionsContainer(
                            'Juice/Smoothies', state, context),
                      ],
                    ),
                  ),
                );
              },
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                switch (state.status) {
                  case HomeStatus.initial:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  case HomeStatus.failure:
                    return GestureDetector(
                      onTap: () {
                        context.read<HomeBloc>().add(GetAllDrinksList());
                      },
                      child: Center(child: Text(state.message.toString())),
                    );
                  case HomeStatus.success:
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 40,
                            mainAxisSpacing: 20,
                            childAspectRatio: 0.7,
                          ),
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 25),
                          itemCount: state.tempDrinksList.isEmpty
                              ? state.drinksList.length
                              : state.tempDrinksList.length,
                          itemBuilder: (context, index) {
                            if (state.tempDrinksList.isNotEmpty) {
                              final filterDrinks = state.tempDrinksList[index];
                              return buildGridContainer(filterDrinks, context);
                            } else {
                              final drink = state.drinksList[index];
                              return buildGridContainer(drink, context);
                            }
                          },
                        ),
                      ],
                    );
                  default:
                    return Center(child: Text(state.message.toString()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

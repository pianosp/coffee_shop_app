import 'package:coffee_shop_app/src/bloc/cart/bloc/cart_bloc.dart';
import 'package:coffee_shop_app/src/bloc/drinks_detail/drinks_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/values/colors.dart';

import '../../bloc/home/home_bloc.dart';
import 'widgets/home_page_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(GetAllDrinksList());
    context.read<CartBloc>().add(CartItemGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      floatingActionButton: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.badge != 0) {
            return buildFloatingBtn(state.badge, context);
          } else {
            return Container();
          }
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeaderSection(),
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
                        buildGridViewDrinks(
                            state.tempDrinksList, state.drinksList),
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

import 'package:coffee_shop_app/src/bloc/edit_drink/edit_drink_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/values/colors.dart';
import '../../../models/cart_items_response';
import '../../../routes/routes.dart';

class SizeSelectOption extends StatelessWidget {
  const SizeSelectOption({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditDrinkBloc, EditDrinkState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              sizeOptionsContainer('S', state.selectedSize, context),
              sizeOptionsContainer('M', state.selectedSize, context),
              sizeOptionsContainer('L', state.selectedSize, context),
            ],
          ),
        );
      },
    );
  }

  Widget sizeOptionsContainer(
      String size, String selectedSize, BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<EditDrinkBloc>().add(SelectSizeOptions(size));
      },
      child: Container(
        width: 85.w,
        height: 40.h,
        decoration: BoxDecoration(
            color:
                size == selectedSize ? AppColors.sizeBackground : Colors.white,
            border: Border.all(
              width: 1.5,
              color: size == selectedSize
                  ? AppColors.primaryElement
                  : AppColors.sizeBorder,
            ),
            borderRadius: BorderRadius.circular(12.r)),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 14.sp,
              color: size == selectedSize
                  ? AppColors.primaryElement
                  : AppColors.firstText,
            ),
          ),
        ),
      ),
    );
  }
}

class QuantitySection extends StatelessWidget {
  final Datum item;
  const QuantitySection({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditDrinkBloc, EditDrinkState>(
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
                  if (state.quantity == 0) {
                    return;
                  } else {
                    context
                        .read<EditDrinkBloc>()
                        .add(MinusQuantityCounter(item.unitPrice ?? 0));
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
              ),
              const SizedBox(width: 25),
              GestureDetector(
                onTap: () => context
                    .read<EditDrinkBloc>()
                    .add(AddQuantityCounter(item.unitPrice ?? 0)),
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
    );
  }
}

class EditDrinkBottomNavbar extends StatelessWidget {
  final Datum item;
  const EditDrinkBottomNavbar({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditDrinkBloc, EditDrinkState>(
        builder: (context, state) {
      return Container(
        width: double.infinity,
        height: 100.h,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColors.botttomNavShadow.withOpacity(0.25),
                blurRadius: 24,
                spreadRadius: 0,
                offset: const Offset(0, -10), // changes position of shadow
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
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 12.sp,
                        color: AppColors.subText),
                  ),
                  Text(
                    "฿ ${state.price}",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: AppColors.primaryElement),
                  ),
                ],
              ),
              if (state.quantity == 0) ...[
                //Remove Btn
                GestureDetector(
                  onTap: () {
                    context
                        .read<EditDrinkBloc>()
                        .add(DeleteSubmitted(item.cartItemId ?? 0));
                  },
                  child: Container(
                    width: 217.w,
                    height: 62.h,
                    decoration: BoxDecoration(
                        color: AppColors.botttomDanger,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Center(
                      child: Text(
                        "Remove",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: AppColors.primaryBackground),
                      ),
                    ),
                  ),
                ),
              ] else ...[
                //Update Btn
                GestureDetector(
                  onTap: () {
                    context.read<EditDrinkBloc>().add(UpdateSubmitted(
                        item.cartItemId ?? 0,
                        state.selectedSize,
                        state.quantity));
                  },
                  child: Container(
                    width: 217.w,
                    height: 62.h,
                    decoration: BoxDecoration(
                        color: AppColors.primaryElement,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Center(
                      child: Text(
                        "Update",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            color: AppColors.primaryBackground),
                      ),
                    ),
                  ),
                ),
              ]
            ],
          ),
        ),
      );
    });
  }
}

class ShowSnackbarSection extends StatelessWidget {
  const ShowSnackbarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditDrinkBloc, EditDrinkState>(
      listener: (context, state) {
        if (state.updateStatus == UpdateDrinkStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Update cart successfully"),
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.popAndPushNamed(context, AppRoute.cart);
          context.read<EditDrinkBloc>().add(ClearState());
        } else if (state.updateStatus == UpdateDrinkStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Failed to update cart"),
            duration: Duration(seconds: 2),
          ));
        } else if (state.deleteStatus == DeleteDrinkStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Delete cart item successfully"),
              duration: Duration(seconds: 2),
            ),
          );
          Navigator.popAndPushNamed(context, AppRoute.cart);
          context.read<EditDrinkBloc>().add(ClearState());
        } else if (state.deleteStatus == DeleteDrinkStatus.failure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Failed to delete cart items"),
            duration: Duration(seconds: 2),
          ));
        }
      },
      child: Container(),
    );
  }
}

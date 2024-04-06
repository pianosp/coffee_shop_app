import 'package:coffee_shop_app/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/validator/validator.dart';
import '../../../../common/values/colors.dart';
import '../../../bloc/login/login_bloc.dart';

Widget buildLoginTextField(
  String hintText,
  String textType,
  String iconName,
) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.5),
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          height: 16.w,
          child: Image.asset(
            "assets/icons/$iconName.png",
            color: AppColors.primaryBackground,
          ),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextFormField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
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
              hintStyle: TextStyle(color: AppColors.primaryBackground),
            ),
            style: TextStyle(
              color: AppColors.primaryBackground,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
            validator: (value) {},
          ),
        )
      ],
    ),
  );
}

Widget buildSignUpTextField(String hintText, String textType, String iconName,
    BuildContext context, TextEditingController controller) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.grey.withOpacity(0.5),
      borderRadius: BorderRadius.all(Radius.circular(15.w)),
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          margin: EdgeInsets.only(left: 17.w),
          height: 16.w,
          child: Image.asset(
            "assets/icons/$iconName.png",
            color: AppColors.primaryBackground,
          ),
        ),
        SizedBox(
          width: 270.w,
          height: 50.h,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
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
              hintStyle: TextStyle(color: AppColors.primaryBackground),
            ),
            style: TextStyle(
              color: AppColors.primaryBackground,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
            keyboardType: textType == "name"
                ? TextInputType.text
                : TextInputType.emailAddress,
            validator: (value) {
              switch (textType) {
                case "name":
                  return validateName(value);
                case "email":
                  return validateEmail(value);
                case "password":
                  return validatePassword(value);
                default:
                  return null;
              }
            }, //validator
            onChanged: (value) {
              if (textType == "name") {
                context.read<SignUpBloc>().add(SignUpNameChanged(value));
              } else if (textType == "email") {
                context.read<SignUpBloc>().add(SignUpEmailChanged(value));
              } else {
                context.read<SignUpBloc>().add(SignUpPasswordChanged(value));
              }
            },
          ),
        )
      ],
    ),
  );
}

Widget buildButton(String buttonName, String buttonType, BuildContext context) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h),
      decoration: BoxDecoration(
        color: buttonType == "login"
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.w),
      ),
      child: Center(
          child: Text(
        buttonName,
        style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
            color: buttonType == "login"
                ? AppColors.primaryBackground
                : AppColors.primaryText),
      )),
    ),
  );
}

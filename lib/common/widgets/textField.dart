import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../src/bloc/login/login_bloc.dart';
import '../../src/bloc/sign_up/sign_up_bloc.dart';
import '../validator/validator.dart';
import '../values/colors.dart';

Widget buildTextField(TextEditingController controller, String textType,
    String hintText, BuildContext context, String message, String authType) {
  Icon? icon;
  switch (textType) {
    case 'name':
      icon = Icon(
        Icons.account_circle,
        color: AppColors.primaryBackground,
      );
      break;
    case 'email':
      icon = Icon(
        Icons.email,
        color: AppColors.primaryBackground,
      );
      break;
    case 'password':
      icon = Icon(
        Icons.lock,
        color: AppColors.primaryBackground,
      );
      break;
    default:
      icon = null; // Or set a default icon if needed
  }
  return Padding(
    padding: EdgeInsets.only(left: 15.w, right: 15.w),
    child: TextFormField(
      controller: controller,
      style: TextStyle(
        color: AppColors.primaryBackground,
        fontWeight: FontWeight.w300,
        fontSize: 14.sp,
      ),
      keyboardType:
          textType == 'email' ? TextInputType.emailAddress : TextInputType.text,
      inputFormatters: [
        textType == 'name'
            ? FilteringTextInputFormatter.deny(RegExp(r'[^a-zA-Z ]'))
            : FilteringTextInputFormatter.allow(RegExp(r'.')),
      ],
      cursorColor: AppColors.primaryBackground,
      autocorrect: false,
      autofocus: authType == 'login' ? false : true,
      obscureText: textType == 'password' ? true : false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.withOpacity(0.5),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.fouthText,
          fontWeight: FontWeight.w300,
          fontSize: 14.sp,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.w),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.w),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.w),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.w),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorText: (textType == 'email' && authType == 'signup')
            ? errorEmailSignup(message)
            : (textType == 'email' && authType == 'login')
                ? errorEmailLogin(message)
                : errorPassword(message),
        errorStyle: TextStyle(fontSize: 14.sp),
        prefixIcon: icon,
      ),
      onChanged: (value) {
        if (authType == 'signup') {
          switch (textType) {
            case "name":
              context.read<SignUpBloc>().add(SignUpNameChanged(value));
            case "email":
              context.read<SignUpBloc>().add(SignUpEmailChanged(value));
            default:
              context.read<SignUpBloc>().add(SignUpPasswordChanged(value));
          }
        } else {
          switch (textType) {
            case "email":
              context.read<LoginBloc>().add(LoginEmailChanged(value));
            default:
              context.read<LoginBloc>().add(LoginPasswordChanged(value));
          }
        }
      },
      validator: (value) {
        switch (textType) {
          case "name":
            if (value!.isEmpty) {
              return 'Please enter a name';
            } else if (controller.text.length < 5) {
              return 'Please enter a name more than 5 characters';
            }
            return null;
          case "email":
            final emailValid = RegExp(
                    r"[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?\.[a-zA-Z][a-zA-Z0-9]{1,6}")
                .hasMatch(value!);
            if (value.isEmpty) {
              return 'Please enter email';
            } else if (!emailValid) {
              return 'Please enter valid email';
            }
            return null;
          default:
            if (value!.isEmpty) {
              return 'Please enter a password';
            } else if (controller.text.length < 8) {
              return 'Password must be at least 8 characters';
            }
            return null;
        }
      },
    ),
  );
}

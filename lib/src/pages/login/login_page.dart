import 'package:coffee_shop_app/src/bloc/login/login_bloc.dart';
import 'package:coffee_shop_app/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:coffee_shop_app/src/pages/home/home_page.dart';
import 'package:coffee_shop_app/src/pages/sign_up/sign_up_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../common/values/colors.dart';
import '../../../common/widgets/textField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailController.clear();
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1510972527921-ce03766a1cf1?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.srcATop),
          ),
        ),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: Text(
                      "Sign In.",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 60,
                        color: AppColors.primaryBackground,
                      ),
                    ),
                  ),
                  buildTextField(_emailController, 'email', 'Enter Email',
                      context, state.message, 'login'),
                  SizedBox(height: 20),
                  buildTextField(_passwordController, 'password',
                      'Enter Password', context, state.message, 'login'),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginBloc>().add(LoginSubmitted(
                            _emailController.text, _passwordController.text));
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 30.h),
                      width: 325.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryElement,
                        borderRadius: BorderRadius.circular(15.w),
                      ),
                      child: Center(
                          child: state.status == LoginStatus.loading
                              ? CircularProgressIndicator(
                                  color: AppColors.primaryBackground,
                                )
                              : Text(
                                  'Sign In',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.primaryBackground),
                                )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                            color: AppColors.primaryBackground,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.rightToLeft,
                                    child: SignUpPage()));
                            context.read<LoginBloc>().add(LoginClearState());
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              color: AppColors.primaryElement,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                      switch (state.status) {
                        case LoginStatus.success:
                          Navigator.pushReplacement(
                              context,
                              PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: const HomePage()));
                        case LoginStatus.initial:
                          return;
                        case LoginStatus.failure:
                          SnackBar(
                            content: Text(
                              state.message,
                              style: TextStyle(
                                color: AppColors.primaryBackground,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.red,
                          );
                        case LoginStatus.loading:
                          return;
                        case null:
                          return;
                      }
                    },
                    child: Container(), // Your widget tree here
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

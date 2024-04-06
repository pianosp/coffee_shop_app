import 'package:coffee_shop_app/src/bloc/sign_up/sign_up_bloc.dart';
import 'package:coffee_shop_app/src/pages/login/login_page.dart';
import 'package:coffee_shop_app/src/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';

import '../../../common/values/colors.dart';
import '../../../common/widgets/textField.dart';

//git add . && git commit -a -m "commit" && git push
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    super.initState();
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
                Colors.black.withOpacity(0.7), BlendMode.srcATop),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40.h, left: 20.w),
                child: IconButton(
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        PageTransition(
                            type: PageTransitionType.leftToRight,
                            child: LoginPage())),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.primaryBackground,
                      size: 30,
                    )),
              ), //Back Btn
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40.h, bottom: 30.h),
                    child: Text(
                      "Sign Up.",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 60,
                        color: AppColors.primaryBackground,
                      ),
                    ),
                  ),
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            buildTextField(_nameController, 'name',
                                'Enter Name', context, state.message, 'signup'),
                            SizedBox(height: 20),
                            buildTextField(
                                _emailController,
                                'email',
                                'Enter Email',
                                context,
                                state.message,
                                'signup'),
                            SizedBox(height: 20),
                            buildTextField(
                                _passwordController,
                                'password',
                                'Enter Password',
                                context,
                                state.message,
                                'signup'),
                            SizedBox(height: 25),
                            GestureDetector(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  context
                                      .read<SignUpBloc>()
                                      .add(SignUpSubmitted(
                                        _nameController.text,
                                        _emailController.text,
                                        _passwordController.text,
                                      ));
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 30.h),
                                width: 325.w,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(15.w),
                                  border: Border.all(
                                    width: 1.5,
                                    color: AppColors.primaryBackground,
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.primaryBackground),
                                )),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  BlocListener<SignUpBloc, SignUpState>(
                    listener: (context, state) {
                      switch (state.status) {
                        case SignUpStatus.success:
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Sign up successful!',
                                style: TextStyle(
                                  color: AppColors.primaryBackground,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                ),
                              ),
                              backgroundColor: Colors.teal,
                            ),
                          );
                          // Navigate the user to the login page
                          Navigator.of(context).pop();
                        case SignUpStatus.initial:
                          return;
                        case SignUpStatus.failure:
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
                      }
                    },
                    child: Container(), // Your widget tree here
                  )
                ],
              ), // TextField and SignUp Btn
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already, have a account? ',
                      style: TextStyle(
                        color: AppColors.primaryBackground,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.leftToRight,
                              child: LoginPage())),
                      // Navigator.pop(context),
                      child: Text(
                        'Sign In',
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
            ],
          ),
        ),
      ),
    );
  }
}

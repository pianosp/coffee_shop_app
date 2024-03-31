import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/values/colors.dart';
import '../../routes/routes.dart';
import 'package:page_transition/page_transition.dart';

import '../home/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryText,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Colors.black.withAlpha(10),
                    Colors.black12,
                    Colors.black45
                  ],
                ),
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    "assets/images/welcome.png",
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 460),
              child: _bodySection(context),
            )
          ],
        ),
      ),
    );
  }
}

Widget _bodySection(BuildContext context) {
  return Column(children: [
    Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w),
      child: Text(
        "Coffee so good, your taste buds will love it.",
        style: TextStyle(
          color: AppColors.primaryBackground,
          fontSize: 34.sp,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    ),
    Container(
      padding: EdgeInsets.only(top: 5.h, left: 40.w, right: 40.w),
      child: Text(
        "The best grain, the finest roast, the powerful flavor.",
        style: TextStyle(
          color: AppColors.secondaryText,
          fontSize: 14.sp,
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
    ),
    GestureDetector(
      onTap: () {
        // Navigator.pushReplacementNamed(context, AppRoute.home);
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.rightToLeft, child: HomePage()));
      },
      child: Container(
        margin: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
        width: 325.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(15.w)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1), // changes position of shadow
              )
            ]),
        child: Center(
          child: Text(
            "Get Started",
            style: TextStyle(
              color: AppColors.primaryBackground,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
  ]);
}

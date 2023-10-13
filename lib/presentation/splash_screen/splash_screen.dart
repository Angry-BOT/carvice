import 'bloc/splash_bloc.dart';
import 'models/splash_model.dart';
import 'package:carvice/core/app_export.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (context) => SplashBloc(SplashState(
        splashModelObj: SplashModel(),
      ))
        ..add(SplashInitialEvent()),
      child: SplashScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  SizedBox(
                    height: 303.v,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgVector1,
                          height: 89.v,
                          width: 390.h,
                          alignment: Alignment.topCenter,
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgVector1,
                          height: 303.v,
                          width: 393.h,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 37.v),
                  Text(
                    "lbl_carvice".tr,
                    style: theme.textTheme.displaySmall,
                  ),
                  SizedBox(height: 12.v),
                  SizedBox(
                    width: 238.h,
                    child: Text(
                      "msg_a_app_that_makes".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  SizedBox(height: 38.v),
                  CustomImageView(
                    svgPath: ImageConstant.imgArrowright,
                    height: 18.adaptSize,
                    width: 18.adaptSize,
                  ),
                  SizedBox(height: 45.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse52,
                    height: 248.v,
                    width: 393.h,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

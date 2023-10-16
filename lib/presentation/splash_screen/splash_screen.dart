import 'bloc/splash_bloc.dart';
import 'models/splash_model.dart';
import 'package:carvice/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    _colorAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.blue,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void navigateToLoginScreen() {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
      ),
    );
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  flex: 2,
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
                              color: Colors.blue,
                              alignment: Alignment.topCenter,
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgVector1,
                              height: 303.v,
                              width: 393.h,
                              color: Colors.blue,
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
                      GestureDetector(
                        onTap: navigateToLoginScreen,
                        child: CustomImageView(
                          svgPath: ImageConstant.imgArrowright,
                          height: 18.adaptSize,
                          width: 18.adaptSize,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 45.v),
                      CustomImageView(
                        alignment: Alignment.bottomCenter,
                        imagePath: ImageConstant.imgEllipse52,
                        color: Colors.blue,
                        height: 264.v,
                        width: 393.h,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

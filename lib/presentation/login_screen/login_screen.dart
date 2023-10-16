import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:carvice/core/app_export.dart';
import 'package:carvice/core/utils/validation_functions.dart';
import 'package:carvice/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(LoginState(loginModelObj: LoginModel()))
        ..add(LoginInitialEvent()),
      child: LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SizedBox(
            width: double.maxFinite,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: 26.v),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 3.h),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(ImageConstant.imgVector1),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: CustomImageView(
                        imagePath: ImageConstant.imgVector1,
                        height: 89.v,
                        width: 390.h,
                        color: Colors.blue, // Set color to blue
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgSaly43,
                      height: 127.v,
                      width: 105.h,
                    ),
                    SizedBox(height: 11.v),
                    Text(
                      "msg_sign_in_to_your".tr,
                      style: theme.textTheme.titleLarge,
                    ),
                    BlocSelector<LoginBloc, LoginState, TextEditingController?>(
                      selector: (state) => state.userNameController,
                      builder: (context, userNameController) {
                        return CustomTextFormField(
                          controller: userNameController,
                          margin: EdgeInsets.only(
                              left: 46.h, top: 25.v, right: 47.h),
                          hintText: "lbl_username".tr,
                          prefix: Container(
                            margin: EdgeInsets.fromLTRB(14.h, 13.v, 4.h, 13.v),
                            child: CustomImageView(
                              svgPath: ImageConstant.imgContrast,
                            ),
                          ),
                          prefixConstraints: BoxConstraints(maxHeight: 50.v),
                          validator: (value) {
                            if (!isText(value)) {
                              return "Please enter valid text";
                            }
                            return null;
                          },
                        );
                      },
                    ),
                    BlocSelector<LoginBloc, LoginState, TextEditingController?>(
                      selector: (state) => state.passwordController,
                      builder: (context, passwordController) {
                        return CustomTextFormField(
                          controller: passwordController,
                          margin: EdgeInsets.only(
                              left: 46.h, top: 41.v, right: 47.h),
                          hintText: "lbl_password".tr,
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          prefix: Container(
                            margin: EdgeInsets.fromLTRB(18.h, 14.v, 8.h, 14.v),
                            child: CustomImageView(
                              svgPath: ImageConstant.imgLock,
                            ),
                          ),
                          prefixConstraints: BoxConstraints(maxHeight: 50.v),
                          validator: (value) {
                            if (value == null ||
                                (!isValidPassword(value, isRequired: true))) {
                              return "Please enter valid password";
                            }
                            return null;
                          },
                          obscureText: true,
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 11.v, right: 51.h),
                        child: Text(
                          "msg_forgot_your_password".tr,
                          style: CustomTextStyles.bodyMediumGray600,
                        ),
                      ),
                    ),
                    SizedBox(height: 84.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 305.v,
                        width: 314.h,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  onTapTxtDonthaveanaccount(context);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 106.v),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "msg_don_t_have_an_account2".tr,
                                          style: CustomTextStyles
                                              .bodyMediumGray900_1,
                                        ),
                                        TextSpan(
                                          text: "lbl_create".tr,
                                          style: CustomTextStyles
                                              .bodyMediumGray900_1
                                              .copyWith(
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            ),
                            CustomImageView(
                              svgPath: ImageConstant.imgArrowright,
                              height: 18.adaptSize,
                              width: 18.adaptSize,
                              color: Colors.black, // Set color to black
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgVector2,
                              width: 94.h,
                              color: Colors.blue, // Set color to blue
                              alignment: Alignment.centerLeft,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Navigates to the signupScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the signupScreen.
  void onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}

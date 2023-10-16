import 'bloc/signup_bloc.dart';
import 'models/signup_model.dart';
import 'package:carvice/core/app_export.dart';
import 'package:carvice/core/utils/validation_functions.dart';
import 'package:carvice/widgets/custom_icon_button.dart';
import 'package:carvice/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carvice/domain/facebookauth/facebook_auth_helper.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignupBloc>(
        create: (context) =>
            SignupBloc(SignupState(signupModelObj: SignupModel()))
              ..add(SignupInitialEvent()),
        child: SignupScreen());
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
                            padding: EdgeInsets.only(bottom: 109.v),
                            child: Column(children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 46.h, top: 34.v, right: 45.h),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgArrowleft,
                                        height: 18.adaptSize,
                                        width: 18.adaptSize,
                                        onTap: () {
                                          onTapImgArrowleftone(context);
                                        }),
                                  )),
                              SizedBox(height: 40.v),
                              Text("lbl_create_account".tr,
                                  style: theme.textTheme.titleLarge),
                              BlocSelector<SignupBloc, SignupState,
                                      TextEditingController?>(
                                  selector: (state) => state.userNameController,
                                  builder: (context, userNameController) {
                                    return CustomTextFormField(
                                        controller: userNameController,
                                        margin: EdgeInsets.only(
                                            left: 46.h, top: 34.v, right: 45.h),
                                        hintText: "lbl_username".tr,
                                        prefix: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                14.h, 13.v, 3.h, 13.v),
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgContrast)),
                                        prefixConstraints:
                                            BoxConstraints(maxHeight: 50.v),
                                        validator: (value) {
                                          if (!isText(value)) {
                                            return "Please enter valid text";
                                          }
                                          return null;
                                        });
                                  }),
                              BlocSelector<SignupBloc, SignupState,
                                      TextEditingController?>(
                                  selector: (state) => state.passwordController,
                                  builder: (context, passwordController) {
                                    return CustomTextFormField(
                                        controller: passwordController,
                                        margin: EdgeInsets.only(
                                            left: 48.h, top: 42.v, right: 45.h),
                                        hintText: "lbl_password".tr,
                                        textInputType:
                                            TextInputType.visiblePassword,
                                        prefix: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                18.h, 14.v, 12.h, 14.v),
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgLock)),
                                        prefixConstraints:
                                            BoxConstraints(maxHeight: 50.v),
                                        validator: (value) {
                                          if (value == null ||
                                              (!isValidPassword(value,
                                                  isRequired: true))) {
                                            return "Please enter valid password";
                                          }
                                          return null;
                                        },
                                        obscureText: true);
                                  }),
                              BlocSelector<SignupBloc, SignupState,
                                      TextEditingController?>(
                                  selector: (state) => state.emailController,
                                  builder: (context, emailController) {
                                    return CustomTextFormField(
                                        controller: emailController,
                                        margin: EdgeInsets.only(
                                            left: 48.h, top: 42.v, right: 45.h),
                                        hintText: "lbl_e_mail".tr,
                                        textInputAction: TextInputAction.done,
                                        textInputType:
                                            TextInputType.emailAddress,
                                        prefix: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                18.h, 19.v, 13.h, 19.v),
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgEmail)),
                                        prefixConstraints:
                                            BoxConstraints(maxHeight: 50.v),
                                        validator: (value) {
                                          if (value == null ||
                                              (!isValidEmail(value,
                                                  isRequired: true))) {
                                            return "Please enter valid email";
                                          }
                                          return null;
                                        });
                                  }),
                              SizedBox(height: 24.v),
                              Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 46.h, top: 34.v, right: 45.h),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgArrowright,
                                        height: 18.adaptSize,
                                        width: 18.adaptSize,
                                        color: Colors.black),
                                  )),
                              Align(
                                  alignment: Alignment.center,
                                  child: SizedBox(
                                      height: 362.v,
                                      // width: 339.h,
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Align(
                                                alignment: Alignment.topCenter,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 80.v),
                                                    child: Text(
                                                        "msg_or_create_account"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .bodyMediumGray900))),
                                            Align(
                                                alignment: Alignment.topCenter,
                                                child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 130.v),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          GestureDetector(
                                                            // onTap:
                                                            //     onTapBtnFacebookone(
                                                            //         context),
                                                            child:
                                                                CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgFacebook,
                                                              height:
                                                                  35.adaptSize,
                                                              width:
                                                                  35.adaptSize,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          10.h,
                                                                      right:
                                                                          10.h),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            // onTap:
                                                            //     onTapBtnFacebookone(
                                                            //         context),
                                                            child:
                                                                CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgTwitter,
                                                              height:
                                                                  35.adaptSize,
                                                              width:
                                                                  35.adaptSize,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          10.h,
                                                                      right:
                                                                          10.h),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            // onTap:
                                                            //     onTapBtnFacebookone(
                                                            //         context),
                                                            child:
                                                                CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgGoogle,
                                                              height:
                                                                  35.adaptSize,
                                                              width:
                                                                  35.adaptSize,
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left:
                                                                          10.h,
                                                                      right:
                                                                          10.h),
                                                            ),
                                                          ),
                                                        ]))),
                                            CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgVector2362x148,
                                                height: 362.v,
                                                width: 148.h,
                                                alignment: Alignment.centerLeft)
                                          ])))
                            ])))))));
  }

  /// Navigates to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is
  /// used to build the navigation stack. When the action is triggered, this
  /// function uses the [NavigatorService] to navigate to the previous screen
  /// in the navigation stack.
  onTapImgArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Performs a Facebook sign-in and returns a [FacebookUser] object.
  ///
  /// If the sign-in is successful, the [onSuccess] callback will be called with
  /// a TODO comment needed to be modified by you.
  /// If the sign-in fails, the [onError] callback will be called with the error message.
  ///
  /// Throws an exception if the Facebook sign-in process fails.
  onTapBtnFacebookone(BuildContext context) async {
    await FacebookAuthHelper().facebookSignInProcess().then((facebookUser) {
      //TODO Actions to be performed after signin
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(onError.toString())));
    });
  }
}

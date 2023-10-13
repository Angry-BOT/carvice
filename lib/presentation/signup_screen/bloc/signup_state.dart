// ignore_for_file: must_be_immutable

part of 'signup_bloc.dart';

/// Represents the state of Signup in the application.
class SignupState extends Equatable {
  SignupState({
    this.userNameController,
    this.passwordController,
    this.emailController,
    this.signupModelObj,
  });

  TextEditingController? userNameController;

  TextEditingController? passwordController;

  TextEditingController? emailController;

  SignupModel? signupModelObj;

  @override
  List<Object?> get props => [
        userNameController,
        passwordController,
        emailController,
        signupModelObj,
      ];
  SignupState copyWith({
    TextEditingController? userNameController,
    TextEditingController? passwordController,
    TextEditingController? emailController,
    SignupModel? signupModelObj,
  }) {
    return SignupState(
      userNameController: userNameController ?? this.userNameController,
      passwordController: passwordController ?? this.passwordController,
      emailController: emailController ?? this.emailController,
      signupModelObj: signupModelObj ?? this.signupModelObj,
    );
  }
}

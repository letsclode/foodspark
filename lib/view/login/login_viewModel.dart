import 'package:flutter/material.dart';
import 'package:foodspark/app/app.locator.dart';
import 'package:foodspark/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.logger.dart';
import '../../shared/enum/bottom_sheet_num.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final NavigationService _navigationService = locator<NavigationService>();
  final BottomSheetService _bottomSheet = locator<BottomSheetService>();

  String? errorMessage;

  final log = getLogger('LoginViewModel');
  final formKey = GlobalKey<FormState>();
  void login() async {
    _navigationService.navigateTo(Routes.homeView);
    // if (formKey.currentState!.validate()) {
    // try {
    //   setBusy(true);
    //   // await _authenticationService
    //   //     .loginWithEmail(emailController.text, passwordController.text)
    //   //     .then((uid) async {
    //   //   if (uid) {
    //   //     if (await _authenticationService.isLogin()) {
    //   //       Fluttertoast.showToast(msg: "Successfuly SignIn");
    //   //       await _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
    //   //     } else {
    //   //       Fluttertoast.showToast(msg: "SignIn fail");
    //   //     }
    //   //   } else {
    //   //     Fluttertoast.showToast(msg: "SignIn fail");
    //   //   }
    //   // });
    //   setBusy(false);
    // } on FirebaseAuthException catch (error) {
    //   switch (error.code) {
    //     case "invalid-email":
    //       errorMessage = "Your email address appears to be malformed.";

    //       break;
    //     case "wrong-password":
    //       errorMessage = "Your password is wrong.";
    //       break;
    //     case "user-not-found":
    //       errorMessage = "User with this email doesn't exist.";
    //       break;
    //     case "user-disabled":
    //       errorMessage = "User with this email has been disabled.";
    //       break;
    //     case "too-many-requests":
    //       errorMessage = "Too many requests";
    //       break;
    //     case "operation-not-allowed":
    //       errorMessage = "Signing in with Email and Password is not enabled.";
    //       break;
    //     default:
    //       errorMessage = "An undefined Error happened.";
    //   }
    //   //TODO: dialogs for error

    //   setBusy(false);
    //   log.e(errorMessage);
    // }
    // }
  }

  void googleSignIn() async {
    setBusy(true);
    // await _authenticationService
    //     .signInWithCredentials(await _googleAuthService.googleSignIn())
    //     .then((value) async {
    //   if (value) {
    //     if (await _authenticationService.isLogin()) {
    //       Fluttertoast.showToast(msg: "Successfuly SignIn");
    //       _sharedPreferencesService.saveLoginType("googleType");
    //       await _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
    //     } else {
    //       _dialogService.showDialog(title: "Fail to SignIn");
    //     }
    //   } else {
    //     print("login back fail");
    //   }
    // });
    setBusy(false);
  }

  void faceBookSignIn() async {
    log.i("Google SignIn");
    // setBusy(true);
    // await _facebookService.facebookSignIn();
    // _authenticationService
    //     .signInWithCredentials(await _facebookService.facebookSignIn())
    //     .then((value) async {
    //   print(value);
    //   if (value) {
    //     if (await _authenticationService.isLogin()) {
    //       showOkToast(title: "Successfuly SignIn");
    //       _sharedPreferencesService.saveLoginType("facebookType");
    //       await _navigationService.pushNamedAndRemoveUntil(Routes.homeView);
    //     } else {
    //       _dialogService.showDialog(title: "Fail to FacebookSignIn");
    //     }
    //   } else {
    //     print("login back fail");
    //   }
    //   setBusy(false);
    // });
  }

  void signUp() async {
    var confirmationResponse = await _bottomSheet.showCustomSheet(
      variant: BottomSheetType.FloatingBox,
      title: "Let's get started...",
      description:
          'This sheet is a custom built bottom sheet UI that allows you to show it from any service or viewmodel.',
      mainButtonTitle: 'Awesome!',
      secondaryButtonTitle: 'This is cool',
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

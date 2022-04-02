import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:foodspark/shared/color.dart';
import 'package:stacked/stacked.dart';
import '../../shared/inputText/input_text.dart';
import '../../shared/path/image_path.dart';
import '../../shared/text.dart';
import '../../shared/text_link.dart';
import '../../shared/ui/loader_view.dart';
import '../../shared/ui/ui_helper.dart';
import 'login_viewModel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
            ? circularProgressCustom
            : Container(
                color: kcSecondary,
                width: screenWidth(context),
                height: screenHeight(context),
                child: Column(
                  children: [
                    verticalSpaceLarge,
                    Expanded(
                        child: Container(
                      color: kcSecondary,
                      child: Center(
                        child: Image.asset(
                          logoImage,
                          scale: 1.5,
                        ),
                      ),
                    )),
                    Expanded(
                      flex: 3,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                            color: kcWhite,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35.0),
                              topRight: Radius.circular(35.0),
                            )),
                        child: SingleChildScrollView(
                          child: Center(
                            child: Form(
                              key: model.formKey,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    verticalSpaceRegular,
                                    Text(
                                      "Lets Get Started!",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(color: kcPrimary),
                                    ),
                                    verticalSpaceSmall,
                                    SizedBox(
                                      width: screenWidth(context) / 1.5,
                                      child: Text(
                                          "Create an accout to be able to sync your data to your devices.",
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption!
                                              .copyWith(
                                                  fontSize: 13,
                                                  color: kcGrayDarker)),
                                    ),
                                    verticalSpaceSmall,
                                    formEmailText(
                                      controller: model.emailController,
                                    ),
                                    verticalSpace(5),
                                    formPassword(
                                        controller: model.passwordController,
                                        title: passwordText),
                                    verticalSpaceTiny,
                                    Row(
                                      children: [
                                        TextLink(
                                          "Forgot Password",
                                          onPressed: () {},
                                        )
                                      ],
                                    ),
                                    verticalSpaceSmall,
                                    ElevatedButton(
                                        onPressed: model.login,
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Center(
                                            child: Text(
                                              loginText,
                                              style: const TextStyle(
                                                  color: kcWhite),
                                            ),
                                          ),
                                        )),
                                    verticalSpaceSmall,
                                    Text("Dont have an account? Sign up today!",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption!
                                            .copyWith(
                                                fontSize: 12,
                                                color: kcGrayDarker)),
                                    verticalSpaceSmall,
                                    SignInButton(Buttons.Email,
                                        onPressed: () {}),
                                    SignInButton(Buttons.FacebookNew,
                                        onPressed: () {}),
                                    SignInButton(Buttons.Google,
                                        onPressed: () {}),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}

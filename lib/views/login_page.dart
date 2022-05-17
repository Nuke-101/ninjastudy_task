import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ninjastudy_task/controllers/auth_controller.dart';
import 'package:ninjastudy_task/views/colors.dart';
import 'package:ninjastudy_task/views/signup_page.dart';
import 'package:ninjastudy_task/views/widgets/button_builder.dart';
import 'package:ninjastudy_task/views/widgets/input_builder.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: GetBuilder<AuthController>(
                init: AuthController(),
                builder: (localController) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: const Alignment(0.0, 0.0),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 40),
                            Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 30,
                                color: defTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 20,
                        ),
                        child: Column(
                          children: [
                            InputBuilder(
                              fieldController: emailController,
                              inputHead: "Email",
                              hintText: "Enter your Email",
                              type: "email",
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            PasswordInputBuilder(
                              fieldController: passwordController,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            FlatButtonBuilder(
                              onTap: () {
                                final email = emailController.text.trim();
                                final password = passwordController.text.trim();
                                if (email.isEmpty || password.isEmpty) {
                                  Get.snackbar(
                                      "Error", "Email or Password is empty");
                                } else {
                                  authController.signIn(email, password);
                                }
                              },
                              buttonText: "Login",
                              color: accentColor,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            GetBuilder<AuthController>(
                                init: AuthController(),
                                builder: (googleController) {
                                  return FlatButtonBuilder(
                                    onTap: () {
                                      googleController.googleSignIn();
                                    },
                                    buttonText: "Login with Google",
                                    color: accentColor,
                                  );
                                }),
                            const SizedBox(height: 25),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Don't have an account? ",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: defTextColor,
                                          fontFamily: "Gilroy",
                                        ),
                                      ),
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.offAll(() => SignUpPage());
                                          },
                                        text: "Register",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: defTextColor,
                                          fontFamily: "Gilroy",
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}

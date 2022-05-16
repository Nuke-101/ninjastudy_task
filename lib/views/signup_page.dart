import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ninjastudy_task/controllers/google_signin_controller.dart';
import 'package:ninjastudy_task/controllers/local_storage_controller.dart';
import 'package:ninjastudy_task/views/colors.dart';
import 'package:ninjastudy_task/views/login_page.dart';
import 'package:ninjastudy_task/views/widgets/button_builder.dart';
import 'package:ninjastudy_task/views/widgets/input_builder.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final googleSignInController = Get.put(GoogleSignInController());
  final localSignInController = Get.put(LocalStorageAuthentication());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: GetBuilder<LocalStorageAuthentication>(
                init: LocalStorageAuthentication(),
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
                              "SignUp",
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
                                localSignInController.signUp(email, password);
                              },
                              buttonText: "SignUp",
                              color: accentColor,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            GetBuilder<GoogleSignInController>(
                                init: GoogleSignInController(),
                                builder: (googleController) {
                                  return FlatButtonBuilder(
                                    onTap: () {
                                      googleController.signIn();
                                    },
                                    buttonText: "SignUp with Google",
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
                                        text: "Already have an account? ",
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: defTextColor,
                                          fontFamily: "Gilroy",
                                        ),
                                      ),
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.offAll(() => LoginPage());
                                          },
                                        text: "Login",
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

import 'package:flutter/material.dart';
import 'package:ninjastudy_task/views/colors.dart';
import 'package:ninjastudy_task/views/widgets/input_builder.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
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
                        inputHead: "Password",
                        hintText: "Enter your password",
                        type: "password",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

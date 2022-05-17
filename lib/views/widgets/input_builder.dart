import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjastudy_task/controllers/obscure_password_controller.dart';
import 'package:ninjastudy_task/views/colors.dart';
import 'package:ninjastudy_task/views/widgets/styles.dart';

class InputBuilder extends StatelessWidget {
  const InputBuilder({
    Key? key,
    required this.fieldController,
    required this.inputHead,
    required this.hintText,
    required this.type,
  }) : super(key: key);

  final TextEditingController fieldController;
  final String inputHead;
  final String hintText;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          inputHead,
          style: labelStyle,
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(.10),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            style: textFormFieldStyle,
            keyboardType: type != "number"
                ? TextInputType.emailAddress
                : TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: hintStyle,
            ),
            controller: fieldController,
          ),
        ),
      ],
    );
  }
}

class PasswordInputBuilder extends StatelessWidget {
  const PasswordInputBuilder({
    Key? key,
    required this.fieldController,
  }) : super(key: key);

  final TextEditingController fieldController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Password",
          style: labelStyle,
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: accentColor.withOpacity(.10),
            borderRadius: BorderRadius.circular(12),
          ),
          child: GetBuilder<ShowPassController>(
              init: ShowPassController(),
              builder: (controller) {
                return Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 45),
                      child: TextFormField(
                        obscureText: controller.invisible,
                        style: textFormFieldStyle,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: hintStyle,
                        ),
                        controller: fieldController,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 6.5,
                      child: GestureDetector(
                        onTapDown: (TapDownDetails details) {
                          controller.showPass(details);
                        },
                        onTapUp: (TapUpDetails details) {
                          controller.hidePass(details);
                        },
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(.25),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: controller.invisible
                                ? Icon(
                                    Icons.visibility_off,
                                    size: 17,
                                    color:
                                        const Color(0xFF1A1922).withOpacity(.5),
                                  )
                                : Icon(
                                    Icons.visibility,
                                    size: 17,
                                    color:
                                        const Color(0xFF1A1922).withOpacity(.5),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}

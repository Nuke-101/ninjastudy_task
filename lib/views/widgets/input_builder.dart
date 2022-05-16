import 'package:flutter/material.dart';
import 'package:ninjastudy_task/views/colors.dart';

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
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w400,
            color: formFieldTextColor,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1F1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            style: const TextStyle(
              fontSize: 18,
              color: formFieldTextColor,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w400,
            ),
            keyboardType: type != "number"
                ? TextInputType.emailAddress
                : TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w300,
                color: hintTextColor,
              ),
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
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w400,
            color: formFieldTextColor,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1F1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextFormField(
            obscureText: true,
            style: const TextStyle(
              fontSize: 18,
              color: formFieldTextColor,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w400,
            ),
            keyboardType: type != "number"
                ? TextInputType.emailAddress
                : TextInputType.number,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 16,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w300,
                color: hintTextColor,
              ),
            ),
            controller: fieldController,
          ),
        ),
      ],
    );
  }
}

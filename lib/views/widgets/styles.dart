import 'package:flutter/material.dart';
import 'package:ninjastudy_task/views/colors.dart';

const TextStyle appBarStyle = TextStyle(
  fontSize: 16,
  fontFamily: "Montserrat",
  color: defTextColor,
  fontWeight: FontWeight.w500,
);

const TextStyle buttonTextStyle = TextStyle(
  fontSize: 18,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

const TextStyle secondaryButtonTextStyle = TextStyle(
  fontSize: 16,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

const TextStyle fabTextStyle = TextStyle(
  fontSize: 14,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

const TextStyle textFormFieldStyle = TextStyle(
  fontSize: 18,
  color: formFieldTextColor,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w400,
);

const TextStyle labelStyle = TextStyle(
  fontSize: 16,
  color: formFieldTextColor,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w400,
);

const TextStyle hintStyle = TextStyle(
  fontSize: 16,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.w300,
  color: hintTextColor,
);

TextStyle textStyleMontserratL(double size, Color color) {
  return TextStyle(
    fontSize: size,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w300,
    color: color,
  );
}

TextStyle textStyleMontserratR(double size, Color color) {
  return TextStyle(
    fontSize: size,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w400,
    color: color,
  );
}

TextStyle textStyleMontserratM(double size, Color color) {
  return TextStyle(
    fontSize: size,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w500,
    color: color,
  );
}

TextStyle textStyleMontserratSB(double size, Color color) {
  return TextStyle(
    fontSize: size,
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w600,
    color: color,
  );
}

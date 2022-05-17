import 'package:flutter/material.dart';
import 'package:ninjastudy_task/views/colors.dart';
import 'package:ninjastudy_task/views/widgets/styles.dart';

class FlatButtonBuilder extends StatelessWidget {
  const FlatButtonBuilder({
    Key? key,
    required this.onTap,
    required this.buttonText,
    required this.color,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const StadiumBorder(),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Center(
            child: Text(
              buttonText,
              style: buttonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}

class GoogleButtonBuilder extends StatelessWidget {
  const GoogleButtonBuilder({
    Key? key,
    required this.onTap,
    required this.buttonText,
    required this.color,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            width: 2,
            color: color,
          )),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          width: 250,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.android,
                size: 28,
                color: color,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                buttonText,
                style: textStyleMontserratM(16, color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

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
              style: const TextStyle(
                fontSize: 18,
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

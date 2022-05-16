import 'package:flutter/material.dart';
import 'package:ninjastudy_task/views/colors.dart';

class ChatChip extends StatelessWidget {
  const ChatChip({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 200),
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: const BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          child: Text(
            text,
            style: const TextStyle(
              color: white,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}

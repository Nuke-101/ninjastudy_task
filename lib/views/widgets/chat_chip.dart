import 'package:flutter/material.dart';
import 'package:ninjastudy_task/views/colors.dart';
import 'package:ninjastudy_task/views/widgets/styles.dart';

class ChatChip extends StatelessWidget {
  const ChatChip({
    Key? key,
    required this.text,
    required this.isHuman,
  }) : super(key: key);

  final String text;
  final bool isHuman;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isHuman ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 200),
            child: Container(
              margin: const EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                  color: isHuman ? accentLight : accentColor,
                  borderRadius: isHuman
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )
                      : const BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        )),
              child: Text(
                text,
                style: textStyleMontserratL(16, white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ninjastudy_task/controllers/conversation_controller.dart';
import 'package:ninjastudy_task/views/colors.dart';
import 'package:ninjastudy_task/views/widgets/styles.dart';

class ConversationCard extends StatelessWidget {
  const ConversationCard({
    Key? key,
    required this.controller,
    required this.i,
  }) : super(key: key);

  final ConversationController controller;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: white,
          boxShadow: [
            BoxShadow(
              color: defTextColor.withOpacity(
                .05,
              ),
              blurRadius: 10,
            ),
          ]),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: accentColor,
                boxShadow: [
                  BoxShadow(
                    color: defTextColor.withOpacity(
                      .15,
                    ),
                    blurRadius: 10,
                  ),
                ]),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Conversation left at",
                  style:
                      textStyleMontserratR(13, defTextColor.withOpacity(.35)),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  controller.conversation[i].lastSentence,
                  style: textStyleMontserratR(
                    15,
                    defTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

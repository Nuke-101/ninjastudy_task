import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjastudy_task/controllers/chat_controller.dart';
import 'package:ninjastudy_task/controllers/conversation_controller.dart';
import 'package:ninjastudy_task/views/colors.dart';
import 'package:ninjastudy_task/views/widgets/chat_chip.dart';
import 'package:ninjastudy_task/views/widgets/styles.dart';

class ChatScreen extends GetView<ChatController> {
  ChatScreen({Key? key, required this.category}) : super(key: key);
  final String category;

  final chatController = Get.put(ChatController());

  final conversationController = Get.find<ConversationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: defTextColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          category + " Chat",
          style: appBarStyle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: GetBuilder<ChatController>(
                init: ChatController(),
                builder: (chatController) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int i = 0; i < chatController.chats.length; i++)
                        Column(
                          children: [
                            ChatChip(
                                text: chatController.chats[i].botSentence,
                                isHuman: false),
                            ChatChip(
                                text: chatController.chats[i].humanSentence,
                                isHuman: true),
                          ],
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Speak the  ",
                            style: textStyleMontserratL(12, defTextColor),
                          ),
                          Container(
                            height: 25,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                              color: accentLight,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                " bubble text ",
                                style: textStyleMontserratL(12, white),
                              ),
                            ),
                          ),
                          Text(
                            "  to continue",
                            style: textStyleMontserratL(12, defTextColor),
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 60),
            child: Stack(
              children: [
                Container(
                  height: 70,
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(10, 10, 70, 10),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(.15),
                  ),
                  child: Obx(
                    () => Container(
                      height: 40,
                      width: double.infinity,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: accentColor.withOpacity(.15),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          controller.spokenText.value.isNotEmpty
                              ? controller.spokenText.value
                              : "Spoken text will appear here",
                          style: controller.spokenText.value.isNotEmpty
                              ? textStyleMontserratM(15, defTextColor)
                              : textStyleMontserratL(
                                  13, defTextColor.withOpacity(.7)),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Obx(
                    () => GestureDetector(
                      onTapDown: (details) {
                        controller.startListening(details);
                      },
                      onTapUp: (details) async {
                        controller.stopListening(details);
                        controller.spokenText.value = "";
                      },
                      child: AnimatedContainer(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: controller.isListening.value
                              ? red
                              : accentColor.withOpacity(.9),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        duration: const Duration(milliseconds: 200),
                        child: Center(
                          child: Icon(
                            controller.isListening.value
                                ? Icons.mic_off
                                : Icons.mic,
                            color: white,
                          ),
                        ),
                      ),
                    ),
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

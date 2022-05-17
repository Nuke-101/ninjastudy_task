import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ninjastudy_task/controllers/chat_controller.dart';
import 'package:ninjastudy_task/controllers/conversation_controller.dart';
import 'package:ninjastudy_task/model/conversation_model.dart';
import 'package:ninjastudy_task/views/colors.dart';
import 'package:ninjastudy_task/views/widgets/chat_chip.dart';

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
            conversationController.update();
          },
        ),
        title: Text(
          category + " Chat",
          style: const TextStyle(
            color: defTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout_outlined,
                color: Color.fromARGB(255, 48, 18, 7),
              )),
        ],
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
                          const Text(
                            "Speak the  ",
                            style: TextStyle(
                              color: defTextColor,
                              fontSize: 12,
                            ),
                          ),
                          Container(
                            height: 25,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            decoration: BoxDecoration(
                              color: accentLight,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Center(
                              child: Text(
                                " bubble text ",
                                style: TextStyle(
                                  color: white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "  to continue",
                            style: TextStyle(
                              color: defTextColor,
                              fontSize: 12,
                            ),
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
                  height: 60,
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 5, 60, 5),
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(.15),
                  ),
                  child: Obx(
                    () => Text(controller.spokenText.value),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
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

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:ninjastudy_task/controllers/chat_controller.dart';
import 'package:ninjastudy_task/views/colors.dart';
import 'package:ninjastudy_task/views/widgets/chat_chip.dart';

class ChatScreen extends GetView<ChatController> {
  ChatScreen({Key? key, required this.category}) : super(key: key);
  final String category;

  final localSignInController = Get.put(ChatController());

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
            Navigator.pop(context);
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
          const Expanded(
            child: SingleChildScrollView(
              child: ChatChip(
                text: "Hello",
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
                      onTap: () {
                        controller.listen();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: controller.isListening.value
                              ? red
                              : accentColor.withOpacity(.9),
                          borderRadius: BorderRadius.circular(15),
                        ),
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

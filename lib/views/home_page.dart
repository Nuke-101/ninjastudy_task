import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjastudy_task/controllers/conversation_controller.dart';
import 'package:ninjastudy_task/views/chat_screen.dart';
import 'package:ninjastudy_task/views/colors.dart';
import 'package:ninjastudy_task/views/widgets/conversation_card.dart';
import 'package:ninjastudy_task/views/widgets/styles.dart';

import '../controllers/auth_controller.dart';

class HomePage extends GetView<ConversationController> {
  HomePage({Key? key}) : super(key: key);

  final chatController = Get.put(ConversationController());

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Ninja App",
          style: appBarStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              authController.signOut();
            },
            icon: const Icon(
              Icons.logout,
              color: defTextColor,
            ),
          ),
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () async {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(
                        Icons.mic,
                        color: defTextColor,
                      ),
                      title: Text(
                        'Interview',
                        style: textStyleMontserratR(
                          16,
                          defTextColor,
                        ),
                      ),
                      onTap: () {
                        Get.to(ChatScreen(
                          category: "Interview",
                        ));
                      },
                    ),
                    ListTile(
                      leading: const Icon(
                        Icons.food_bank,
                        color: defTextColor,
                      ),
                      title: Text(
                        'Restaurant',
                        style: textStyleMontserratR(
                          16,
                          defTextColor,
                        ),
                      ),
                      onTap: () {
                        Get.to(ChatScreen(
                          category: "Restaurant",
                        ));
                      },
                    ),
                  ],
                );
              });
        },
        child: Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: accentColor.withOpacity(.5),
                  blurRadius: 15,
                )
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.chat_bubble_outline,
                color: white,
                size: 18,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Start a conversation',
                style: fabTextStyle,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.conversation.isNotEmpty
              ? Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    for (int i = 0; i < controller.conversation.length; i++)
                      GestureDetector(
                        onTap: () {
                          Get.to(ChatScreen(
                            category: "restaurant",
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 5,
                          ),
                          child: ConversationCard(controller: controller, i: i),
                        ),
                      ),
                  ],
                )
              : SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "No Conversations",
                      style: textStyleMontserratM(16, defTextColor),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

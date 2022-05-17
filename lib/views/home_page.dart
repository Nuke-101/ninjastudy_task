import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjastudy_task/controllers/chat_controller.dart';
import 'package:ninjastudy_task/controllers/conversation_controller.dart';
import 'package:ninjastudy_task/views/chat_screen.dart';
import 'package:ninjastudy_task/views/colors.dart';

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
          "Product Authentication",
          style: TextStyle(
            color: defTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
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
                      leading: new Icon(Icons.mic),
                      title: new Text('Interview'),
                      onTap: () {
                        Get.to(ChatScreen(
                          category: "Interview",
                        ));
                      },
                    ),
                    ListTile(
                      leading: new Icon(Icons.food_bank),
                      title: new Text('Restaurant'),
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
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Start a conversation',
                style: TextStyle(
                  fontSize: 15,
                  color: white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: controller.getConversations(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Obx(
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
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
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
                                          borderRadius:
                                              BorderRadius.circular(15),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Conversation left at",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color:
                                                  defTextColor.withOpacity(.5),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            controller
                                                .conversation[i].lastSentence,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: defTextColor,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    )
                  : const SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: Expanded(
                        child: Center(
                          child: Text(
                            "No Conversations",
                            style: TextStyle(
                              color: defTextColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
            );
          }
          {
            return const CircularProgressIndicator(
              color: accentColor,
            );
          }
        },
      )),
    );
  }
}

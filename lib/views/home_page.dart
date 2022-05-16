import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninjastudy_task/views/chat_screen.dart';
import 'package:ninjastudy_task/views/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout_outlined,
                color: Color.fromARGB(255, 48, 18, 7),
              )),
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
    );
  }
}

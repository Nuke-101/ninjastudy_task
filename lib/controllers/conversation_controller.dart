import 'package:get/get.dart';
import 'package:ninjastudy_task/model/conversation_model.dart';

class ConversationController extends GetxController {
  List conversation = [].obs;

  @override
  void onInit() async {
    super.onInit();
    await getConversations();
  }

  Future<dynamic> getConversations() async {
    if (conversation.isEmpty) {
      update();
      return [];
    } else {
      update();
      return conversation;
    }
  }
}

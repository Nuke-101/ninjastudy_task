import 'package:ninjastudy_task/model/chat_model.dart';

enum ChatCategory {
  restaurant,
  interview,
}

class Conversation {
  List<Chat> conversationChat = [];
  late String lastSentence;

  Conversation(this.conversationChat, this.lastSentence);
}

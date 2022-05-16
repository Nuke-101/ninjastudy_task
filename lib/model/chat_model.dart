class Chat {
  late String botSentence;
  late String humanSentence;

  Chat(this.botSentence, this.humanSentence);

  Chat.fromJson(Map<String, dynamic> json) {
    botSentence = json["bot"];
    humanSentence = json["human"];
  }
}

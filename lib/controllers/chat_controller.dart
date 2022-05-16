import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:ninjastudy_task/model/chat_model.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  var isListening = false.obs;
  var spokenText = "".obs;
  late SpeechToText speechToText;

  List<Chat> dialogues = [];

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    speechToText = SpeechToText();
    dialogues = await fetchDialogs();
  }

  Future<dynamic> getDialogues() async {}

  Future fetchDialogs() async {
    final url =
        Uri.https("my-json-server.typicode.com", "tryninjastudy/dummyapi/db");
    print(url);
    var response = await http.get(url);
    List<Chat> dialogues = [];
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> dialoguesJson = jsonResponse["restaurant"];
      print(dialoguesJson);
      print(jsonResponse);

      for (int i = 0; i < dialoguesJson.length; i++) {
        dialogues.add(Chat.fromJson(dialoguesJson[i]));
      }
    }
    return dialogues;
  }

  void startListening(TapDownDetails details) async {
    bool available = await speechToText.initialize(
      onStatus: (status) {
        print(status);
      },
      onError: (error) {
        print(error);
      },
    );
    if (available) {
      isListening.value = true;
      speechToText.listen(
        listenMode: ListenMode.dictation,
        onResult: (value) {
          spokenText.value = value.recognizedWords;
        },
      );
    }
  }

  void stopListening(TapUpDetails details) async {
    await speechToText.stop();
    isListening.value = false;
    spokenText.value = "";
  }
}

import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ChatController extends GetxController {
  var isListening = false.obs;
  var spokenText = "".obs;
  late SpeechToText speechToText;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    speechToText = SpeechToText();
  }

  void listen() async {
    if (!isListening.value) {
      bool available = await speechToText.initialize();
      if (available) {
        isListening.value = true;
        speechToText.listen(onResult: (value) {
          spokenText.value = value.recognizedWords;
        });
      }
    } else {
      isListening.value = false;
      speechToText.stop();
      spokenText.value = "";
    }
  }
}

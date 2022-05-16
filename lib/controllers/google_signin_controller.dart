import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ninjastudy_task/views/home_page.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  Future<dynamic> signIn() async {
    print("Google signin started");

    try {
      googleAccount.value = await _googleSignIn.signIn();
      if (googleAccount.value != null) {
        Get.offAll(HomePage());
      }
      print(googleAccount);
    } catch (error) {
      print(error);
    }
  }

  Future<dynamic> signOut() async {
    print("Google signUp started");

    try {
      googleAccount.value = await _googleSignIn.signOut();
      print(googleAccount);
    } catch (error) {
      print(error);
    }
  }
}

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  Future<dynamic> signIn() async {
    print("Google signin started");

    try {
      var signInResult = await _googleSignIn.signIn();
      print(signInResult);
    } catch (error) {
      print(error);
    }
  }
}

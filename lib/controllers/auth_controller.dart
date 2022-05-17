import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ninjastudy_task/views/home_page.dart';
import 'package:ninjastudy_task/views/login_page.dart';

class AuthController extends GetxController {
  final storage = GetStorage();

  var currentGoogleAccount = Rx<GoogleSignInAccount?>(null);
  var isLocalLogin = false.obs;
  var isGoogleLogin = false.obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    isLocalLogin.value = await getLocalDetails();
    isGoogleLogin.value = await getGoogleDetails();
    getPage();
  }

  bool validatePassword(String password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(password);
  }

  Future<dynamic> signUp(email, password) async {
    try {
      if (validatePassword(password) && GetUtils.isEmail(email)) {
        storage.write("email", email);
        print(storage.read("email"));
        storage.write("password", password);
        print(storage.read("password"));
        Get.offAll(HomePage());
      } else if (!validatePassword(password)) {
        Get.snackbar("Password Error",
            "Please include at least one lowercase alphabet, uppercase alphabet, symbol and number");
      } else if (!GetUtils.isEmail(email)) {
        Get.snackbar("Email Error", "Please enter valid email");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Couldn't signUp");
    }
  }

  Future<dynamic> signIn(email, password) async {
    try {
      var storedEmail = storage.read("email");
      var storedPassword = storage.read("password");
      if (storedEmail == email && storedPassword == password) {
        Get.offAll(HomePage());
      } else {
        Get.snackbar("Error", "Error logging in, credentials don't match");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> googleSignIn() async {
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

  Future<bool> getLocalDetails() async {
    var storedEmail = storage.read("email");
    var storedPassword = storage.read("password");
    if (storedEmail == null || storedPassword == null) {
      print("email");
      print(false);
      return false;
    } else {
      print("email");
      print(true);
      return true;
    }
  }

  Future<bool> getGoogleDetails() async {
    var bool = await GoogleSignIn().isSignedIn();

    if (bool) {
      print("google");
      print(true);
      return true;
    } else {
      print("google");
      print(false);
      return false;
    }
  }

  Future<bool> getPage() async {
    if (isGoogleLogin.value || isLocalLogin.value) {
      return true;
    } else {
      return false;
    }
  }
}

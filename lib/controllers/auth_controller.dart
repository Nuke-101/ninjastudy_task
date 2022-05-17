import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ninjastudy_task/views/home_page.dart';
import 'package:ninjastudy_task/views/login_page.dart';

class AuthController extends GetxController {
  final storage = GetStorage();

  var isLocalLogin = false.obs;
  var isGoogleLogin = false.obs;

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  final userStatus = "LoggedOut";

  @override
  void onInit() async {
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
        storage.write("password", password);
        storage.write("userStatus", "LoggedIn");
        Get.offAll(HomePage());
      } else if (!validatePassword(password)) {
        Get.snackbar("Password Error",
            "Please include at least one lowercase alphabet, uppercase alphabet, symbol and number");
      } else if (!GetUtils.isEmail(email)) {
        Get.snackbar("Email Error", "Please enter valid email");
      }
    } catch (e) {
      Get.snackbar("Error", "Couldn't signUp");
    }
  }

  Future<dynamic> signIn(email, password) async {
    try {
      var storedEmail = storage.read("email");
      var storedPassword = storage.read("password");
      if (storedEmail == email && storedPassword == password) {
        storage.write("userStatus", "LoggedIn");
        Get.offAll(HomePage());
      } else {
        Get.snackbar("Error", "Error logging in, credentials don't match");
      }
    } catch (e) {
      Get.snackbar("Error", "Couldn't signIn");
    }
  }

  Future<dynamic> signOut() async {
    try {
      var userStatus = storage.read("userStatus");
      bool isGoogleSignedIn = await _googleSignIn.isSignedIn();
      print(googleAccount);

      if (userStatus == "LoggedIn") {
        storage.write("userStatus", "LoggedOut");
        print(userStatus);
        Get.offAll(LoginPage());
      } else if (isGoogleSignedIn) {
        _googleSignIn.signOut();
        Get.offAll(LoginPage());
      }
    } catch (e) {
      Get.snackbar("Error", "Error Signing out");
    }
  }

  Future<dynamic> googleSignIn() async {
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
    var userStatus = storage.read("userStatus");
    if (userStatus == "loggedOut") {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> getGoogleDetails() async {
    var bool = await GoogleSignIn().isSignedIn();
    if (bool) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getPage() async {
    var userStatus = storage.read("userStatus");
    bool isGoogleSignedIn = await _googleSignIn.isSignedIn();
    if (userStatus == "LoggedIn" || isGoogleSignedIn) {
      return true;
    } else {
      return false;
    }
  }
}

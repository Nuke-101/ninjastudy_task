import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ninjastudy_task/views/home_page.dart';

class LocalStorageAuthentication extends GetxController {
  final storage = GetStorage();

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
        Get.offAll(const HomePage());
      } else if (!validatePassword(password)) {
        Get.snackbar("Password Error",
            "Please include at least one lowercase alphabet, uppercase alphabet, symbol and number");
      } else if (!GetUtils.isEmail(email)) {
        Get.snackbar("Email Error", "Please enter valid email");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<dynamic> signIn(email, password) async {
    try {
      var storedEmail = storage.read("email");
      var storedPassword = storage.read("password");
      if (storedEmail == email && storedPassword == password) {
        Get.offAll(const HomePage());
      }
    } catch (e) {
      print(e);
    }
  }
}

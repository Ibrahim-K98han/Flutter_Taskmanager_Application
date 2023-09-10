import 'package:shared_preferences/shared_preferences.dart';

class AuthUtils {
  static String? firstName, lastName, token, profilePic, mobile, email;

  static Future<void> saveUserData(
    String userFirstName,
    String userLastName,
    String userToken,
    String userProfilePic,
    String userMobileNumber,
    String userEmail,
  ) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', userToken);
    await sharedPreferences.setString('firstName', userFirstName);
    await sharedPreferences.setString('lastName', userLastName);
    await sharedPreferences.setString('mobile', userMobileNumber);
    await sharedPreferences.setString('picture', userProfilePic);
    await sharedPreferences.setString('email', userEmail);

    firstName = userFirstName;
    lastName = userLastName;
    token = userToken;
    profilePic = userProfilePic;
    mobile = userMobileNumber;
    email = userEmail;
  }

  static Future<bool> checkLoginState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    if (token == null) {
      return false;
    } else {
      return true;
    }
  }

  static Future<void> getAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    firstName = sharedPreferences.getString('firstName');
    lastName = sharedPreferences.getString('lastName');
    profilePic = sharedPreferences.getString('picture');
    mobile = sharedPreferences.getString('mobile');
    email = sharedPreferences.getString('email');
  }

  static Future<void> clearData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}

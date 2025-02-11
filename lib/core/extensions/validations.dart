abstract class Validations {
 home-feature

  static bool validateEmail(String email) {
    final RegExp emailRegExp =
    RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  static bool validatePassword(String password) {
    final RegExp passwordRegExp =
    RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

    return passwordRegExp.hasMatch(password);

  static bool isEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  static bool isPassword(String password) {
    final passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return passwordRegex.hasMatch(password);
master
  }
}
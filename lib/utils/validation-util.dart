import 'package:login_signup_ui_flutter_app/utils/string-utils.dart';

class ValidationUtil {
  String validateEmail(String value) {
    if (value.isEmpty) {
      return StringUtils.enterEmail;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return StringUtils.enterValidEmail;
    }
    return null;
  }

  bool isValidEmail(String value) {
    if (value.isEmpty) {
      return false;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return false;
    }
    return true;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return StringUtils.enterPassword;
    } else if (!RegExp("^.{6,30}").hasMatch(value)) {
      return StringUtils.enterValidPassword;
    }
    return null;
  }

  String validateConfirmPassword(String confirmvalue, String password) {
    if (confirmvalue.isEmpty) {
      return StringUtils.enterConfirmPassword;
    } else if (confirmvalue.compareTo(password) != 0) {
      return StringUtils.enterMatchPassword;
    }
    return null;
  }

  String validatePhoneNumberField(String value) {
    if (value.isEmpty) {
      return StringUtils.enterPhoneNumber;
    } else if (value.length < 9 && value.length > 20) {
      return StringUtils.enterValidPhoneNumber;
    }
    return null;
  }

  bool isValidPhoneNumber(String value) {
    if (value.isEmpty) {
      return false;
    } else if (value.length > 9 && value.length < 50) {
      value = value.replaceAll(new RegExp(r'[^\w\s]+'), '');
      value = value.replaceAll(' ', '');
      if (isNumeric(value)) {
        return true;
      }
      return false;
    }
    return false;
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }

  String validateField(String value, String errorMessage) {
    if (value.isEmpty) {
      return errorMessage;
    }
    return null;
  }

  static bool validateFieldEmpty(String value) {
    if (value.isEmpty) {
      return false;
    }
    return true;
  }
}

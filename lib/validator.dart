class Validator {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Required Field';
    }

    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(email)) {
      return "Please enter a valid email id";
    }

    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Required Field';
    } else if (password.length < 8) {
      return "Please enter atleast 8 characters for password";
    }

    return null;
  }
}

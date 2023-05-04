class LoginValidate {
  bool emailValid(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool passValid(String password) {
    return password.length >= 8;
  }

  bool phoneValid(String phone) {
    return RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(phone);
  }
}

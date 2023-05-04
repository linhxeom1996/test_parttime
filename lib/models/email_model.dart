enum EmailInfo { invalid, valid, empty }

extension EmailInfoEx on EmailInfo {
  String get info {
    switch (this) {
      case EmailInfo.invalid:
        return "Email or phone format not valid";
      case EmailInfo.valid:
        return 'Email or phone valid';
      case EmailInfo.empty:
        return '';
    }
  }
}

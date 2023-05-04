enum PassInfo { invalid, valid, empty }

extension PassInfoEx on PassInfo {
  String get info {
    switch (this) {
      case PassInfo.invalid:
        return "Password format not valid";
      case PassInfo.valid:
        return 'Password valid';
      case PassInfo.empty:
        return '';
    }
  }
}

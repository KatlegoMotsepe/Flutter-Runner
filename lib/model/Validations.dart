extension StringExtension on String {
  

  bool isName() {
    final RegExp reg =
        RegExp(r'^[a-zA-ZÀ-ÖØ-öø-ſ]+(?:[-\s][a-zA-ZÀ-ÖØ-öø-ſ]+)*$');
    return reg.hasMatch(this);
  }

  bool isEmail() {
    final RegExp reg = RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$');
    return reg.hasMatch(this);
  }

  bool isValidPassword() {
    final RegExp reg = RegExp(
        r'^(?=.*[!@#\$%^&*(),.?":{}|<>])(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9]).{8,}$');
    return reg.hasMatch(this);
  }

  bool hasSpecialChar() {
    final RegExp reg = RegExp(r'(?=.*[!@#\$%^&*(),.?":{}|<>])');
    return reg.hasMatch(this);
  }

  bool hasUppercase() {
    final RegExp reg = RegExp(r'(?=.*[A-Z])');
    return reg.hasMatch(this);
  }

  bool hasLowercase() {
    final RegExp reg = RegExp(r'(?=.*[a-z])');
    return reg.hasMatch(this);
  }

  bool hasNumber() {
    final RegExp reg = RegExp(r'(?=.*[0-9])');
    return reg.hasMatch(this);
  }

  bool longEnough() {
    final RegExp reg = RegExp(r'.{6,}');
    return reg.hasMatch(this);
  }
}

import '../extensions/string_apis.dart' show StringValidator;

abstract class StringValidator {
  bool isValid(String value);
  String errorText(String value);
}

class EmailValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.emailValidation;
  }

  @override
  String errorText(String value) {
    if (value?.isEmpty == true) return null; // Clear error text
    if (!value.emailValidation) return 'Enter a valid email';
    return null;
  }
}

class PasswordValidator implements StringValidator {
  @override
  bool isValid(String value) {
    return value.passwordValidation;
  }

  @override
  String errorText(String value) {
    if (value.containsSpace) return 'Space not allowed';
    if (value?.isEmpty == true) return null; // Clear error text
    if (!value.passwordValidation) {
      return 'Password must contain A-z, 0-9 and least 6 characters';
    }
    return null;
  }
}

/// Email and Password valitator
class Validator {
  final StringValidator emailValidator = EmailValidator();
  final StringValidator passwordValidator = PasswordValidator();
}

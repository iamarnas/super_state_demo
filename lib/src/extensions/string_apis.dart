extension StringValidator on String {
  /// Validate email with [RegExp]. Must match `name@example.co(m)`
  bool get emailValidation {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,3}))$';
    var regexp = RegExp(pattern);
    return regexp.hasMatch(this);
  }

  /// If password contains A-z, 0-9 and least 6 characters then return `true``
  /// space not allowed then return `false`
  bool get passwordValidation {
    // Advanced password validation with [RegExp]
    //
    // * (?=.*[A-Z]) The string must contain at least 1 uppercase alphabetical character
    // * (?=.*[0-9]) The string must contain at least 1 numeric character
    // * (?=.{6,}) The string must be six characters or longer
    // * (?!.*\s) Space not allowed
    //
    // Password must contain A-z, 0-9 and least 6 characters
    var pattern = r'(?=.*[A-Z])(?=.*[0-9])(?=.{6,})(?!.*[\s])';
    var regex = RegExp(pattern);
    return regex.hasMatch(this);
  }

  /// If [String] value contains space then return `true`
  bool get containsSpace {
    var pattern = r'(?=.*[\s])';
    var regexp = RegExp(pattern);
    return regexp.hasMatch(this);
  }
}

extension StringExtensions on String {
  /// [String] starts with a capital letter
  String get startWithCapitalLetter {
    return this[0].toUpperCase() + this.substring(1);
  }
}

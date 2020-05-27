import 'package:flutter_super_state/flutter_super_state.dart';
import 'package:super_state_demo/src/models/validation_item.dart';
import 'package:super_state_demo/src/store/validators.dart' show Validator;

class ValidationFormModule extends StoreModule with Validator {
  ValidationItem _email = ValidationItem(null, null);
  ValidationItem get email => _email;

  ValidationItem _password = ValidationItem(null, null);
  ValidationItem get password => _password;

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  bool get hasError {
    return _email.value == null ||
        _email.error != null ||
        _password.value == null ||
        _password.error != null;
  }

  ValidationFormModule(Store store) : super(store) {
    reset();
  }

  void updateEmail(String value) {
    if (emailValidator.isValid(value)) return submitEmail(value);
    setEmailErrorText(emailValidator.errorText(value));
  }

  void updatePassword(String value) {
    // Give priority to validator check whitespaces
    if (!value.contains(' ')) {
      if (passwordValidator.isValid(value)) return submitPassword(value);
    }
    setPasswordErrorText(passwordValidator.errorText(value));
  }

  void toggleObscureText() {
    setState(() => _isObscure = !_isObscure);
  }

  void setEmailErrorText(String value) {
    setState(() => _email = ValidationItem(null, value));
  }

  void submitEmail(String value) {
    setState(() => _email = ValidationItem(value, null));
  }

  void setPasswordErrorText(String value) {
    setState(() => _password = ValidationItem(null, value));
  }

  void submitPassword(String value) {
    setState(() => _password = ValidationItem(value, null));
  }

  void reset() {
    setState(() {
      _email = ValidationItem(null, null);
      _password = ValidationItem(null, null);
      _isObscure = true;
    });
  }
}

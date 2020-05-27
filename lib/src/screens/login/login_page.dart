import 'package:flutter/material.dart';
import 'package:flutter_super_state/flutter_super_state.dart';

import '../../../src/screens/home_page.dart';
import '../../store/modules.dart' show ValidationFormModule;

import 'widgets/validation_input.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, _) => LoginPage(),
      transitionsBuilder: (context, animation, _, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    final textStyle = const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            alignment: Alignment.center,
            width: 312,
            child: ModuleBuilder<ValidationFormModule>(
              builder: (context, module) {
                return Column(
                  children: <Widget>[
                    orientation == Orientation.portrait
                        ? const SizedBox(height: 240)
                        : const SizedBox(height: 64),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text('Welcom', style: textStyle),
                    ),
                    const SizedBox(height: 16),
                    ValidationInput(
                      labelText: 'Email',
                      hintText: 'name@email.com',
                      prefixIcon: Icon(Icons.person_outline),
                      errorText: module.email.error,
                      onChanged: module.updateEmail,
                      onSubmitted: module.hasError ? null : module.submitEmail,
                    ),
                    const SizedBox(height: 16),
                    ValidationInput(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline),
                      errorText: module.password.error,
                      onChanged: module.updatePassword,
                      onSubmitted:
                          module.hasError ? null : module.submitPassword,
                      isPassword: true,
                      obscureText: module.isObscure,
                      toggleObscureText: () => module.toggleObscureText(),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: 200,
                      height: 48,
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        child: Text('Log in', style: TextStyle(fontSize: 18)),
                        onPressed: () {
                          if (module.hasError) {
                            _handleLoginError(module);
                          } else {
                            _goToHomePage(context);
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

void _handleLoginError(ValidationFormModule module) {
  // if email intput not completed return error text
  if (module.email.value == null && module.email.error != null) {
    module.setEmailErrorText('Complete email before continuing');
    // if email intput is empty return error text
  } else if (module.email.value?.isEmpty ?? true) {
    module.setEmailErrorText('Email can\'t be empty');
  }
  // if password intput not completed return error text
  if (module.password.value == null && module.password.error != null) {
    module.setPasswordErrorText('Complete password before continuing');
    // if password intput is empty return error text
  } else if (module.password.value == null && module.password.error == null) {
    module.setPasswordErrorText('Password can\'t be empty');
  }
}

void _goToHomePage(BuildContext context) {
  Navigator.pushReplacement(context, HomePage.route());
  FocusScope.of(context).unfocus();
}

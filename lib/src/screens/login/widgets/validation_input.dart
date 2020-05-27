import 'package:flutter/material.dart';

class ValidationInput extends StatelessWidget {
  final double maxWidth;
  final String labelText;
  final String errorText;
  final String hintText;
  final bool obscureText;
  final bool isPassword;
  final Widget prefixIcon;
  final void Function(String) onChanged;
  final void Function(String) onSubmitted;
  final void Function() toggleObscureText;

  const ValidationInput({
    Key key,
    this.maxWidth,
    @required this.labelText,
    this.errorText,
    this.hintText,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.toggleObscureText,
    this.isPassword = false,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
        child: TextField(
          keyboardType: isPassword
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress,
          obscureText: obscureText,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 8),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: prefixIcon,
                  )
                : null,
            prefixIconConstraints: BoxConstraints(
              minHeight: 26,
              minWidth: 26,
            ),
            labelText: labelText,
            hintText: hintText,
            errorText: errorText,
            suffixIcon: isPassword
                ? IconButton(
                    icon: obscureText
                        ? Icon(
                            Icons.visibility_off,
                            color: Theme.of(context).unselectedWidgetColor,
                          )
                        : Icon(
                            Icons.visibility,
                            color: Theme.of(context).accentColor,
                          ),
                    onPressed: toggleObscureText,
                  )
                : null,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:yia/common/variables.dart';

class PasswordFormField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordFormField({
    Key key,
    @required this.controller,
  })  : assert(controller != null),
        super(key: key);
  @override
  _PasswordFormFieldState createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        obscureText: !_showPassword,
        style: Theme.of(context).textTheme.bodyText2,
        controller: widget.controller,
        decoration: InputDecoration(
            labelStyle: TextStyle(color: inputLabelColor),
            hintStyle: TextStyle(color: inputHintColor),
            labelText: 'Password',
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              child: Icon(
                _showPassword ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ),
            )),
        validator: (String value) {
          if (value.isEmpty) {
            return 'Please provide a password';
          }
          return null;
        },
      ),
    );
  }
}

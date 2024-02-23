import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback? _onPressed;

  LoginButton(this._onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
        minimumSize: Size(88, 36),
        padding: EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2)),
        ));

    return ElevatedButton(
      style: raisedButtonStyle,
      onPressed: _onPressed,
      child: Text('Login'),
    );
  }
}

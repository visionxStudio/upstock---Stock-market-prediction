import 'package:flutter/material.dart';
import 'package:upstock/src/common/constants/constants.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kScafoldColor,
      body: Stack(
        children: const <Widget>[],
      ),
    );
  }
}

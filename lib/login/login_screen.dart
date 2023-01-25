import 'package:flutter/material.dart';
import 'login_view.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginView());
  }
}

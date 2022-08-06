import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login / Register'),
        elevation: 0,
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Authentication Screen'),
      ),
    );
  }
}

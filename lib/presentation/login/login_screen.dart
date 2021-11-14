import 'package:flutter/material.dart';
import 'package:messenger/presentation/home/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = 'LoginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushReplacementNamed(HomeScreen.routeName),
          child: const Text('Einloggen'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:messenger/presentation/login/login_screen.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => Navigator.of(context).pushNamed(LoginScreen.routeName),
        child: const Text('Ausloggen'),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:messenger/domain/auth/use_cases/sign_out_use_case.dart';
import 'package:messenger/presentation/auth/auth_screen.dart';

class HomeScreenChatList extends StatelessWidget {
  const HomeScreenChatList({
    required this.onChatSelected,
    Key? key,
  }) : super(key: key);

  final void Function(String id) onChatSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // TODO move into settings page
          IconButton(
            onPressed: () async {
              await SignOutUseCase()();
              Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              child: Text('MM'),
            ),
            title: const Text('Max Mustermann'),
            subtitle: const Text('Hier ist eine Nachricht'),
            trailing: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(
                children: const [
                  Text('14.11.21'),
                ],
              ),
            ),
            onTap: () => onChatSelected('abc'),
          ),
        ],
      ),
    );
  }
}

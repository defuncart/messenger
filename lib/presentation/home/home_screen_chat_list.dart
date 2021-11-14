import 'package:flutter/material.dart';

class HomeScreenChatList extends StatelessWidget {
  const HomeScreenChatList({
    required this.onChatSelected,
    Key? key,
  }) : super(key: key);

  final void Function(String id) onChatSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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

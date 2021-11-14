import 'package:flutter/material.dart';

class HomeScreenChatDetail extends StatelessWidget {
  static const routeName = 'HomeScreenChatDetail';

  const HomeScreenChatDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              child: Text('MM'),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: DefaultTextStyle(
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white,
                    ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Max Mustermann',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    Text(
                      'zul. online vor 3 Stunden',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: const SizedBox.shrink(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:messenger/presentation/home/home_screen_chat_detail.dart';
import 'package:messenger/presentation/home/home_screen_chat_list.dart';

@visibleForTesting
const largeScreenBreakpoint = 440.0;

@visibleForTesting
bool isLargeScreen(BuildContext context) => MediaQuery.of(context).size.width >= largeScreenBreakpoint;

class HomeScreen extends StatelessWidget {
  static const routeName = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLargeScreen(context)
        ? Row(
            children: [
              SizedBox(
                width: 300,
                child: HomeScreenChatList(
                  onChatSelected: (_) {},
                ),
              ),
              const Expanded(
                child: HomeScreenChatDetail(),
              ),
            ],
          )
        : HomeScreenChatList(
            onChatSelected: (_) => Navigator.of(context).pushNamed(HomeScreenChatDetail.routeName),
          );
  }
}

import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/presentation/home/home_screen.dart';
import 'package:messenger/presentation/home/home_screen_chat_detail.dart';
import 'package:messenger/presentation/home/home_screen_chat_list.dart';

import '../../test_utils.dart';

void main() {
  group('$HomeScreen', () {
    testWidgets('On small screen, expect detail', (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(
        largeScreenBreakpoint - 1,
        largeScreenBreakpoint - 1,
      );
      tester.binding.window.devicePixelRatioTestValue = 1;

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });

      await tester.pumpWidget(
        wrapWithMaterialApp(const HomeScreen()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreenChatList), findsOneWidget);
      expect(find.byType(HomeScreenChatDetail), findsNothing);
    });

    testWidgets('On large screen, expect master detail', (tester) async {
      tester.binding.window.physicalSizeTestValue = const Size(
        largeScreenBreakpoint,
        largeScreenBreakpoint,
      );
      tester.binding.window.devicePixelRatioTestValue = 1;

      addTearDown(() {
        tester.binding.window.clearPhysicalSizeTestValue();
        tester.binding.window.clearDevicePixelRatioTestValue();
      });

      await tester.pumpWidget(
        wrapWithMaterialApp(const HomeScreen()),
      );
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreenChatList), findsOneWidget);
      expect(find.byType(HomeScreenChatDetail), findsOneWidget);
    });
  });
}

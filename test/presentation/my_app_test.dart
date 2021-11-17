import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/presentation/my_app.dart';

import '../mocks.dart';

void main() {
  group('$MyApp', () {
    testWidgets('Ensure initial loading state', (tester) async {
      await tester.pumpWidget(
        const MyApp(),
      );

      expect(find.byType(MyApp), findsOneWidget);
      expect(find.byType(MyAppLoading), findsOneWidget);
      expect(find.byType(MyAppContent), findsNothing);
    });

    testWidgets('Ensure data state', (tester) async {
      MethodChannelMocks.setupFirebase();

      await tester.pumpWidget(
        const MyApp(),
      );
      await tester.pumpAndSettle();

      expect(find.byType(MyApp), findsOneWidget);
      expect(find.byType(MyAppLoading), findsNothing);
      expect(find.byType(MyAppContent), findsOneWidget);
    });
  });
}

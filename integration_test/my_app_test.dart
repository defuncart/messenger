import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:messenger/main.dart' as app;
import 'package:messenger/presentation/my_app.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('E2E', () {
    testWidgets('ensure app builds', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.byType(MyApp), findsOneWidget);
    });
  });
}

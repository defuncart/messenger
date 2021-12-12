import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:messenger/domain/auth/auth_repository.dart';
import 'package:messenger/presentation/auth/auth_screen.dart';
import 'package:messenger/presentation/home/home_screen.dart';
import 'package:messenger/presentation/home/home_screen_chat_detail.dart';
import 'package:messenger/service_locator.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _isInitialized = false;
  late bool _isUserAuthenticated;

  @override
  void initState() {
    super.initState();

    _initApp();
  }

  Future<void> _initApp() async {
    await Firebase.initializeApp();
    ServiceLocator.initialize();
    _isUserAuthenticated = ServiceLocator.get<AuthRepository>().isUserAuthenticated;

    setState(() => _isInitialized = true);
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized ? MyAppContent(isAuthenticated: _isUserAuthenticated) : const MyAppLoading();
  }
}

@visibleForTesting
class MyAppLoading extends StatelessWidget {
  const MyAppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: SizedBox.shrink(),
    );
  }
}

@visibleForTesting
class MyAppContent extends StatelessWidget {
  const MyAppContent({
    required this.isAuthenticated,
    Key? key,
  }) : super(key: key);

  final bool isAuthenticated;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      initialRoute: isAuthenticated ? HomeScreen.routeName : AuthScreen.routeName,
      routes: {
        AuthScreen.routeName: (_) => const AuthScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        HomeScreenChatDetail.routeName: (_) => const HomeScreenChatDetail(),
      },
    );
  }
}

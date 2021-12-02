import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:messenger/presentation/auth/auth_screen.dart';
import 'package:messenger/presentation/home/home_screen.dart';
import 'package:messenger/presentation/home/home_screen_chat_detail.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _isInitialized = false;

  @override
  void initState() {
    super.initState();

    _initApp();
  }

  Future<void> _initApp() async {
    await Firebase.initializeApp();

    setState(() => _isInitialized = true);
  }

  @override
  Widget build(BuildContext context) {
    return _isInitialized ? const MyAppContent() : const MyAppLoading();
  }
}

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
  const MyAppContent({Key? key}) : super(key: key);

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
      initialRoute: AuthScreen.routeName,
      routes: {
        AuthScreen.routeName: (_) => const AuthScreen(),
        HomeScreen.routeName: (_) => const HomeScreen(),
        HomeScreenChatDetail.routeName: (_) => const HomeScreenChatDetail(),
      },
    );
  }
}

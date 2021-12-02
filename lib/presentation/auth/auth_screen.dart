import 'package:flutter/material.dart';
import 'package:messenger/presentation/auth/auth_screen_view_model.dart';
import 'package:messenger/presentation/auth/widgets/sms_code_auth_panel.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = 'AuthScreen';

  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthScreenViewModel(),
      builder: (context, _) => Consumer<AuthScreenViewModel>(
        builder: (context, viewModel, _) => AuthScreenContent(
          viewModel: viewModel,
        ),
      ),
    );
  }
}

class AuthScreenContent extends StatelessWidget {
  const AuthScreenContent({
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final AuthScreenViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Builder(
          builder: (context) {
            switch (viewModel.state) {
              case AuthScreenState.phoneNumber:
                return PhoneNumberAuthPanel();
              case AuthScreenState.smsCode:
                return const SMSCodeAuthPanel();
            }
          },
        ),
      ),
    );
  }
}

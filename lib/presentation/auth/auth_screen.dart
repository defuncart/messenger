import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:messenger/common/widgets/modal_progress_indicator.dart';
import 'package:messenger/presentation/auth/auth_screen_view_model.dart';
import 'package:messenger/presentation/auth/widgets/phone_number_auth_panel.dart';
import 'package:messenger/presentation/auth/widgets/sms_code_auth_panel.dart';
import 'package:messenger/presentation/home/home_screen.dart';
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
            if (viewModel.isLoading) {
              Future.microtask(
                () => ModalProgressIndicator.show(context),
              );
            } else {
              ModalProgressIndicator.hide();
            }

            switch (viewModel.state) {
              case AuthScreenState.phoneNumber:
                return PhoneNumberAuthPanel(
                  onPhoneNumberSubmitted: viewModel.onPhoneNumberSubmitted,
                  error: viewModel.phoneNumberIsInvalid
                      ? AppLocalizations.of(context)!.authScreenPhoneNumberPanelErrorText
                      : null,
                );
              case AuthScreenState.smsCode:
                return SMSCodeAuthPanel(
                  phoneNumber: viewModel.phoneNumberWithCountryCode,
                  onCodeSubmitted: (code) async {
                    final success = await viewModel.onCodeSubmitted(code);
                    if (success) {
                      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            AppLocalizations.of(context)!.authScreenSmsCodePanelCodeInvalidText,
                          ),
                        ),
                      );
                    }
                  },
                  onResendCode: () async {
                    final codeSent = await viewModel.onResendCode();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(codeSent
                            ? AppLocalizations.of(context)!.authScreenSmsCodePanelCodeResentText
                            : AppLocalizations.of(context)!.generalErrorOccured),
                      ),
                    );
                  },
                  onChangeNumber: viewModel.onChangeNumber,
                );
            }
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:gap/gap.dart';

typedef OnPhoneNumberSubmitted = void Function(String countryCode, String phoneNumber);

class PhoneNumberAuthPanel extends StatefulWidget {
  const PhoneNumberAuthPanel({
    required this.onPhoneNumberSubmitted,
    this.error,
    this.initialPhoneNumber,
    Key? key,
  }) : super(key: key);

  final OnPhoneNumberSubmitted onPhoneNumberSubmitted;
  final String? error;
  final String? initialPhoneNumber;

  @visibleForTesting
  static const countryCode = '+49';

  @override
  State<PhoneNumberAuthPanel> createState() => _PhoneNumberAuthPanelState();
}

class _PhoneNumberAuthPanelState extends State<PhoneNumberAuthPanel> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  var _canSubmit = false;
  String? _error;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.initialPhoneNumber)
      ..addListener(() {
        final canSubmit = _controller.text.isNotEmpty;
        if (canSubmit != _canSubmit) {
          setState(() => _canSubmit = canSubmit);
        }
        if (_error != null && _controller.text.isEmpty) {
          setState(() => _error = null);
        }
      });
    _focusNode = FocusNode()..requestFocus();
    _error = widget.error;
  }

  @override
  void didUpdateWidget(PhoneNumberAuthPanel oldWidget) {
    super.didUpdateWidget(oldWidget);

    _error = widget.error;
    if (!_focusNode.hasFocus) {
      _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.messenger_outline_rounded,
          size: 128,
          color: Theme.of(context).colorScheme.secondary,
        ),
        Text(
          AppLocalizations.of(context)!.appTitle,
          style: Theme.of(context).textTheme.headline4,
        ),
        Text(
          AppLocalizations.of(context)!.authScreenPhoneNumberPanelSubtitleText,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const Gap(16),
        SizedBox(
          width: 200,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                PhoneNumberAuthPanel.countryCode,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Gap(4),
              Expanded(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.authScreenPhoneNumberPanelHintText,
                    errorText: _error,
                  ),
                  onEditingComplete: _submit,
                ),
              ),
            ],
          ),
        ),
        const Gap(16),
        ElevatedButton(
          child: Text(
            AppLocalizations.of(context)!.generalContinue,
          ),
          onPressed: _canSubmit ? _submit : null,
        ),
      ],
    );
  }

  void _submit() {
    if (_canSubmit) {
      widget.onPhoneNumberSubmitted(
        PhoneNumberAuthPanel.countryCode,
        _controller.text,
      );
      _focusNode.unfocus();
    }
  }
}

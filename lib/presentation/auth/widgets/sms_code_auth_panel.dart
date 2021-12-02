import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:gap/gap.dart';

class SMSCodeAuthPanel extends StatefulWidget {
  const SMSCodeAuthPanel({Key? key}) : super(key: key);

  @override
  State<SMSCodeAuthPanel> createState() => _SMSCodeAuthPanelState();
}

class _SMSCodeAuthPanelState extends State<SMSCodeAuthPanel> {
  var _canSubmit = false;
  var _smsCode = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          AppLocalizations.of(context)!.authScreenSmsCodePanelTitleText,
          style: Theme.of(context).textTheme.headline4,
        ),
        const Gap(32),
        DigitTextFields(
          count: 6,
          onChanged: (allDigitsFilled, text) => setState(() {
            _canSubmit = allDigitsFilled;
            _smsCode = text;
          }),
        ),
        const Gap(16),
        TextButton(
          child: Text(
            AppLocalizations.of(context)!.authScreenSmsCodePanelNoCodeReceiveButtonText,
          ),
          onPressed: () {},
        ),
        const Gap(32),
        ElevatedButton(
          child: Text(
            AppLocalizations.of(context)!.generalContinue,
          ),
          onPressed: _canSubmit ? () {} : null,
        ),
      ],
    );
  }
}

class DigitTextFields extends StatefulWidget {
  const DigitTextFields({
    required this.count,
    required this.onChanged,
    this.spaceBetween = 8,
    Key? key,
  })  : assert(count > 0),
        super(key: key);

  final int count;
  final double spaceBetween;
  final void Function(bool allDigitsFilled, String text) onChanged;

  @override
  _DigitTextFieldsState createState() => _DigitTextFieldsState();
}

class _DigitTextFieldsState extends State<DigitTextFields> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  var _allDigitsFilled = false;
  var _text = '';

  @override
  void initState() {
    super.initState();

    _focusNodes = List<FocusNode>.generate(widget.count, (index) => FocusNode(debugLabel: 'FocusNode$index')).toList();
    _focusNodes.first.requestFocus();
    _controllers = List<TextEditingController>.generate(widget.count, (index) => TextEditingController()).toList();
    for (final controller in _controllers) {
      controller.addListener(_updateVars);
    }
  }

  void _updateVars() {
    final allDigitsFilled =
        _controllers.fold<bool>(true, (previousValue, controller) => previousValue && controller.text.isNotEmpty);
    final text = _controllers.fold<String>('', (previousValue, controller) => previousValue + controller.text);

    if (_allDigitsFilled != allDigitsFilled || _text != text) {
      _allDigitsFilled = allDigitsFilled;
      _text = text;
      widget.onChanged(_allDigitsFilled, _text);
    }
  }

  @override
  void dispose() {
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    for (final controller in _controllers) {
      controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < widget.count; i++) ...[
          DigitTextField(
            controller: _controllers[i],
            focusNode: _focusNodes[i],
            previousFocusNode: i > 0 ? _focusNodes[i - 1] : null,
            nextFocusNode: i < widget.count - 1 ? _focusNodes[i + 1] : null,
          ),
          if (i < widget.count - 1) Gap(widget.spaceBetween),
        ],
      ],
    );
  }
}

class DigitTextField extends StatelessWidget {
  const DigitTextField({
    required this.controller,
    required this.focusNode,
    this.previousFocusNode,
    this.nextFocusNode,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? previousFocusNode;
  final FocusNode? nextFocusNode;

  @override
  Widget build(BuildContext context) {
    final _keyboardFocusNode = FocusNode();
    return SizedBox(
      width: 25,
      child: RawKeyboardListener(
        focusNode: _keyboardFocusNode,
        onKey: (event) {
          if (event.logicalKey == LogicalKeyboardKey.backspace || event.logicalKey == LogicalKeyboardKey.delete) {
            _keyboardFocusNode.previousFocus();
            controller.clear();
          } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
            if (previousFocusNode != null) {
              _keyboardFocusNode.previousFocus();
            }
          } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
            _keyboardFocusNode.nextFocus();
          }
        },
        child: TextField(
          controller: controller,
          maxLength: 1,
          focusNode: focusNode,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
          onChanged: (code) {
            if (code.length == 1) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            } else if (code.isEmpty) {
              FocusScope.of(context).requestFocus(previousFocusNode);
            }
          },
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            hintText: '*',
            counterText: '',
          ),
        ),
      ),
    );
  }
}

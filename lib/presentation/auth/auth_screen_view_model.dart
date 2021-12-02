import 'package:flutter/material.dart';

enum AuthScreenState {
  phoneNumber,
  smsCode,
}

class AuthScreenViewModel extends ChangeNotifier {
  var _state = AuthScreenState.phoneNumber;
  AuthScreenState get state => _state;
}

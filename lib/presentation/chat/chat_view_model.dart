import 'dart:async';

import 'package:flutter/material.dart';
import 'package:messenger/domain/chat/entity/chat_entity.dart';
import 'package:messenger/domain/chat/use_cases/watch_chat_use_case.dart';
import 'package:messenger/domain/message/entity/message_entity.dart';
import 'package:messenger/domain/message/use_cases/send_message_use_case.dart';
import 'package:messenger/domain/message/use_cases/watch_messages_use_case.dart';
import 'package:messenger/presentation/message/message_view_model.dart';

class ChatViewModel extends ChangeNotifier {
  ChatViewModel({
    WatchChatUseCase? watchChatUseCase,
    WatchMessagesUseCase? watchMessagesUseCase,
    SendMessageUseCase? sendMessageUseCase,
  })  : _watchChatUseCase = watchChatUseCase ?? WatchChatUseCase(),
        _watchMessagesUseCase = watchMessagesUseCase ?? WatchMessagesUseCase(),
        _sendMessageUseCase = sendMessageUseCase ?? SendMessageUseCase();

  final WatchChatUseCase _watchChatUseCase;
  final WatchMessagesUseCase _watchMessagesUseCase;
  final SendMessageUseCase _sendMessageUseCase;

  var _hasError = false;
  StreamSubscription<ChatEntity>? _watchChatSubscription;
  StreamSubscription<List<MessageEntity>>? _watchMessagesSubscription;
  ChatEntity? _chatEntity;
  final _messageViewModels = <MessageViewModel>[];

  void initialize({required String chatId}) {
    _watchChatSubscription?.cancel();
    _watchChatSubscription = _watchChatUseCase(chatId).listen((event) {
      if (event.hasValue) {
        _chatEntity = event;
        _watchMessagesSubscription?.cancel();
        _watchMessagesSubscription = _watchMessagesUseCase(event.value.messages).listen((event) {
          _messageViewModels.clear();
          for (final entity in event) {
            _messageViewModels.add(
              MessageViewModel()..initialize(entity),
            );
          }
          notifyListeners();
        });
      } else {
        _hasError = true;
        notifyListeners();
      }
    });
  }

  bool get hasError => _hasError;
  String get title => _chatEntity!.value.title;
  List<MessageViewModel> get messages => _messageViewModels;

  @override
  void dispose() {
    _watchChatSubscription?.cancel();
    _watchMessagesSubscription?.cancel();
    super.dispose();
  }

  Future<void> sendMessage(String text) => _sendMessageUseCase(text);
}

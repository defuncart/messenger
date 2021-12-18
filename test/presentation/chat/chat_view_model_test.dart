import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/auth/auth_repository.dart';
import 'package:messenger/domain/chat/entity/chat_entity.dart';
import 'package:messenger/domain/message/entity/message_entity.dart';
import 'package:messenger/presentation/chat/chat_view_model.dart';
import 'package:messenger/service_locator.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../test_utils.dart';

void main() {
  group('$ChatViewModel', () {
    late MockWatchChatUseCase mockWatchChatUseCase;
    late MockWatchMessagesUseCase mockWatchMessagesUseCase;
    late MockSendMessageUseCase mockSendMessageUseCase;
    late ChatViewModel viewModel;

    setUp(() {
      mockWatchChatUseCase = MockWatchChatUseCase();
      mockWatchMessagesUseCase = MockWatchMessagesUseCase();
      mockSendMessageUseCase = MockSendMessageUseCase();
      viewModel = ChatViewModel(
        watchChatUseCase: mockWatchChatUseCase,
        watchMessagesUseCase: mockWatchMessagesUseCase,
        sendMessageUseCase: mockSendMessageUseCase,
      );
    });

    const chatId = 'chatId';

    group('when $ChatEntity has a failure', () {
      setUp(() {
        final entity = ChatEntity.failure(ChatNotFoundFailure());
        when(() => mockWatchChatUseCase(chatId)).thenAnswer((_) => Stream.value(entity));
        viewModel.initialize(chatId: chatId);
      });

      test('expect hasError isTrue', () {
        expect(viewModel.hasError, isTrue);
      });

      test('expect messages isEmpty', () {
        expectLater(viewModel.messages, isEmpty);
      });
    });

    group('when $ChatEntity has a value', () {
      const chatTitle = 'chatTitle';
      const messageIds = ['messageId'];

      late MockAuthRepository mockAuthRepository;
      late List<MessageEntity> messageEntities;

      setUp(() {
        final entity = TestEntities.chat(
          id: chatId,
          title: chatTitle,
          messages: messageIds,
        );
        messageEntities = [TestEntities.message(id: messageIds.first)];
        when(() => mockWatchChatUseCase(chatId)).thenAnswer((_) => Stream.value(entity));
        when(() => mockWatchMessagesUseCase(messageIds)).thenAnswer((_) => Stream.value(messageEntities));

        mockAuthRepository = MockAuthRepository();
        ServiceLocator.testRegister<AuthRepository>(mockAuthRepository);

        viewModel.initialize(chatId: chatId);
      });

      tearDown(ServiceLocator.reset);

      test('expect hasError isFalse', () {
        expect(viewModel.hasError, isFalse);
      });

      test('expect title', () {
        expect(viewModel.title, chatTitle);
      });

      test('expect messages', () async {
        // small delay to ensure view model is initialized
        await Future.delayed(const Duration(milliseconds: 10));

        expect(viewModel.messages, hasLength(1));
        expect(viewModel.messages.first.hasError, isFalse);
      });
    });

    group('sendMessage', () {
      const text = 'text';

      test('expect that use case is called', () async {
        when(() => mockSendMessageUseCase.call(text)).thenAnswer((_) => Future.value(TestEntities.message(text: text)));

        await viewModel.sendMessage(text);

        verify(() => mockSendMessageUseCase.call(text));
      });
    });
  });
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/chat/entity/chat_entity.dart';
import 'package:messenger/infrastructure/chat/chat_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../test_utils.dart';

void main() {
  group('$ChatRepositoryImpl', () {
    late FirebaseFirestore fakeFirebaseFirestore;
    late MockDateTimeGenerator mockDateTimeGenerator;
    late MockIdGenerator mockIdGenerator;
    late ChatRepositoryImpl chatRepositoryImpl;

    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();
      mockDateTimeGenerator = MockDateTimeGenerator();
      mockIdGenerator = MockIdGenerator();
      chatRepositoryImpl = ChatRepositoryImpl(
        firebaseFirestore: fakeFirebaseFirestore,
        dateTimeGenerator: mockDateTimeGenerator,
        idGenerator: mockIdGenerator,
      );
    });

    test('createChat', () async {
      final now = DateTime(1);
      when(() => mockDateTimeGenerator.nowUtc).thenReturn(now);
      const id = 'id';
      when(() => mockIdGenerator.generate()).thenReturn(id);

      const title = '';
      const userIds = ['user1'];
      const createdBy = 'createdBy';

      final chat = await chatRepositoryImpl.createChat(
        userIds: userIds,
        createdBy: createdBy,
      );

      expect(
        chat,
        TestEntities.chat(
          id: id,
          title: title,
          userIds: userIds,
          createdBy: createdBy,
        ),
      );

      final snapshot = await fakeFirebaseFirestore.collection('chats').doc(id).get();

      expect(
        snapshot.data(),
        {
          'id': 'id',
          'messages': [],
          'title': '',
          'userIds': ['user1'],
          'createdBy': 'createdBy',
          'createdAt': '0001-01-01T00:00:00.000',
          'updatedAt': null,
          'deletedAt': null,
        },
      );
    });

    group('getChat', () {
      const id = 'id';

      test('when no chat in db, expect $ChatNotFoundFailure failure', () async {
        final chat = await chatRepositoryImpl.getChat(id: id);
        expect(chat, ChatEntity.failure(ChatNotFoundFailure()));
      });

      test('when chat data in db is not valid, expect $ChatCouldNotBeParsedFailure failure', () async {
        await fakeFirebaseFirestore.collection('chats').doc(id).set({});
        final chat = await chatRepositoryImpl.getChat(id: id);
        expect(chat, ChatEntity.failure(ChatCouldNotBeParsedFailure()));
      });

      test('when chat in db, expect entity', () async {
        await fakeFirebaseFirestore.collection('chats').doc(id).set({
          'id': 'id',
          'messages': [],
          'title': '',
          'userIds': ['user1'],
          'createdBy': 'createdBy',
          'createdAt': '0001-01-01T00:00:00.000',
          'updatedAt': null,
          'deletedAt': null,
        });

        final chat = await chatRepositoryImpl.getChat(id: id);
        expect(chat, TestEntities.chat(userIds: ['user1']));
      });
    });

    group('watchChat', () {
      const id = 'id';

      late ChatEntity initialChat;

      group('when the chat is in the db', () {
        setUp(() async {
          await fakeFirebaseFirestore.collection('chats').doc(id).set({
            'id': 'id',
            'messages': [],
            'title': '',
            'userIds': ['user1'],
            'createdBy': 'createdBy',
            'createdAt': '0001-01-01T00:00:00.000',
            'updatedAt': null,
            'deletedAt': null,
          });

          initialChat = TestEntities.chat(userIds: ['user1']);
        });

        test('expect correct stream', () {
          final stream = chatRepositoryImpl.watchChat(id: id);

          expect(
            stream,
            emitsInOrder([initialChat]),
          );
        });
      });

      group('and when the chat is update', () {
        late ChatEntity updatedChat;

        setUp(() async {
          await fakeFirebaseFirestore.collection('chats').doc(id).set({
            'id': 'id',
            'messages': [],
            'title': '',
            'userIds': ['user1', 'user2'],
            'createdBy': 'createdBy',
            'createdAt': '0001-01-01T00:00:00.000',
            'updatedAt': null,
            'deletedAt': null,
          });

          updatedChat = TestEntities.chat(userIds: ['user1', 'user2']);
        });

        test('expect correct stream', () {
          final stream = chatRepositoryImpl.watchChat(id: id);

          expect(
            stream,
            emitsInOrder([updatedChat]),
          );
        });
      });
    });

    group('deleteChat', () {
      const id = 'id';

      test('when chat in db, expect deletedAt is not null', () async {
        final now = DateTime(1);
        when(() => mockDateTimeGenerator.nowUtc).thenReturn(now);

        await fakeFirebaseFirestore.collection('chats').doc(id).set({
          'id': 'id',
          'messages': [],
          'title': '',
          'userIds': ['user1'],
          'createdBy': 'createdBy',
          'createdAt': '0001-01-01T00:00:00.000',
          'updatedAt': null,
          'deletedAt': null,
        });

        await chatRepositoryImpl.deleteChat(id: id);

        final snapshot = await fakeFirebaseFirestore.collection('chats').doc(id).get();
        expect(
          snapshot.data(),
          {
            'id': 'id',
            'messages': [],
            'title': '',
            'userIds': ['user1'],
            'createdBy': 'createdBy',
            'createdAt': '0001-01-01T00:00:00.000',
            'updatedAt': null,
            'deletedAt': '0001-01-01T00:00:00.000',
          },
        );
      });
    });
  });

  test('When firebase is not faked, expect that FirebaseFirestore is default', () async {
    final mockDateTimeGenerator = MockDateTimeGenerator();
    final mockIdGenerator = MockIdGenerator();

    MethodChannelMocks.setupFirebase();
    await Firebase.initializeApp();

    expect(
      () => ChatRepositoryImpl(
        dateTimeGenerator: mockDateTimeGenerator,
        idGenerator: mockIdGenerator,
      ),
      returnsNormally,
    );
  });
}

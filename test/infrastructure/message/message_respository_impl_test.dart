import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/message/entity/message_entity.dart';
import 'package:messenger/infrastructure/message/message_respository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../test_utils.dart';

void main() {
  group('$MessageRepositoryImpl', () {
    late FirebaseFirestore fakeFirebaseFirestore;
    late MockDateTimeGenerator mockDateTimeGenerator;
    late MockIdGenerator mockIdGenerator;
    late MessageRepositoryImpl messageRepositoryImpl;

    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();
      mockDateTimeGenerator = MockDateTimeGenerator();
      mockIdGenerator = MockIdGenerator();
      messageRepositoryImpl = MessageRepositoryImpl(
        firebaseFirestore: fakeFirebaseFirestore,
        dateTimeGenerator: mockDateTimeGenerator,
        idGenerator: mockIdGenerator,
      );
    });

    test('createMessage', () async {
      final now = DateTime(1);
      when(() => mockDateTimeGenerator.nowUtc).thenReturn(now);
      const id = 'id';
      when(() => mockIdGenerator.generate()).thenReturn(id);

      const text = 'text';
      const createdBy = 'createdBy';

      final message = await messageRepositoryImpl.createMessage(
        text: text,
        createdBy: createdBy,
      );

      expect(
        message,
        TestEntities.message(
          id: id,
          text: text,
          createdBy: createdBy,
          createdAt: now,
        ),
      );

      final snapshot = await fakeFirebaseFirestore.collection('messages').doc(id).get();

      expect(
        snapshot.data(),
        {
          'id': 'id',
          'text': 'text',
          'createdBy': 'createdBy',
          'createdAt': '0001-01-01T00:00:00.000',
          'updatedAt': null,
          'deletedAt': null,
        },
      );
    });

    group('updateMessage', () {
      const id = 'id';

      test('when message is updated, expect updatedAt is not null', () async {
        final now = DateTime(1);
        when(() => mockDateTimeGenerator.nowUtc).thenReturn(now);

        await fakeFirebaseFirestore.collection('messages').doc(id).set({
          'id': 'id',
          'text': 'text',
          'createdBy': 'createdBy',
          'createdAt': '0001-01-01T00:00:00.000',
          'updatedAt': null,
          'deletedAt': null,
        });

        await messageRepositoryImpl.updateMessage(id: id, text: 'updatedText');

        final snapshot = await fakeFirebaseFirestore.collection('messages').doc(id).get();
        expect(
          snapshot.data(),
          {
            'id': 'id',
            'text': 'updatedText',
            'createdBy': 'createdBy',
            'createdAt': '0001-01-01T00:00:00.000',
            'updatedAt': '0001-01-01T00:00:00.000',
            'deletedAt': null,
          },
        );
      });
    });

    group('getMessage', () {
      const id = 'id';

      test('when no message in db, expect $MessageNotFoundFailure failure', () async {
        final message = await messageRepositoryImpl.getMessage(id: id);
        expect(message, MessageEntity.failure(MessageNotFoundFailure()));
      });

      test('when message data in db is not valid, expect $MessageCouldNotBeParsedFailure failure', () async {
        await fakeFirebaseFirestore.collection('messages').doc(id).set({});
        final message = await messageRepositoryImpl.getMessage(id: id);
        expect(message, MessageEntity.failure(MessageCouldNotBeParsedFailure()));
      });

      test('when message in db, expect entity', () async {
        await fakeFirebaseFirestore.collection('messages').doc(id).set({
          'id': 'id',
          'text': 'text',
          'createdBy': 'createdBy',
          'createdAt': '0001-01-01T00:00:00.000',
          'updatedAt': null,
          'deletedAt': null,
        });

        final message = await messageRepositoryImpl.getMessage(id: id);
        expect(message, TestEntities.message());
      });
    });

    group('getMessages', () {
      const id1 = 'id1';
      const id2 = 'id2';
      const ids = [id1, id2];

      test('when messages are in db, expect a List of MessageEntity', () async {
        await fakeFirebaseFirestore.collection('messages').doc(id1).set({
          'id': 'id1',
          'text': 'text',
          'createdBy': 'createdBy',
          'createdAt': '0001-01-01T00:00:00.000',
          'updatedAt': null,
          'deletedAt': null,
        });
        await fakeFirebaseFirestore.collection('messages').doc(id2).set({
          'id': 'id2',
          'text': 'text',
          'createdBy': 'createdBy',
          'createdAt': '0001-01-01T00:00:00.000',
          'updatedAt': null,
          'deletedAt': null,
        });

        final messages = await messageRepositoryImpl.getMessages(ids: ids);

        expect(messages, [
          TestEntities.message(id: id1),
          TestEntities.message(id: id2),
        ]);
      });
    });

    group('watchMessages', () {
      const ids = ['id1', 'id2'];
      final dates = [DateTime(1), DateTime(2)];

      final messages = [
        for (var i = 0; i < ids.length; i++)
          TestEntities.message(
            id: ids[i],
            createdAt: dates[i],
          ),
      ];

      group('when the messages are in the db', () {
        setUp(() async {
          for (var i = 0; i < 2; i++) {
            await fakeFirebaseFirestore.collection('messages').doc(ids[i]).set({
              'id': ids[i],
              'text': 'text',
              'createdBy': 'createdBy',
              'createdAt': dates[i].toIso8601String(),
              'updatedAt': null,
              'deletedAt': null,
            });
          }
        });

        test('expect two messages sorted by createdAt', () {
          final stream = messageRepositoryImpl.watchMessages(ids: ids);

          expect(
            stream,
            emitsInOrder([messages]),
          );
        });
      });
    });

    group('deleteMessage', () {
      const id = 'id';

      test('when message in db, expect deletedAt is not null', () async {
        final now = DateTime(1);
        when(() => mockDateTimeGenerator.nowUtc).thenReturn(now);

        await fakeFirebaseFirestore.collection('messages').doc(id).set({
          'id': 'id',
          'text': 'text',
          'createdBy': 'createdBy',
          'createdAt': '0001-01-01T00:00:00.000',
          'updatedAt': null,
          'deletedAt': null,
        });

        await messageRepositoryImpl.deleteMessage(id: id);

        final snapshot = await fakeFirebaseFirestore.collection('messages').doc(id).get();
        expect(
          snapshot.data(),
          {
            'id': 'id',
            'text': 'text',
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
      () => MessageRepositoryImpl(
        dateTimeGenerator: mockDateTimeGenerator,
        idGenerator: mockIdGenerator,
      ),
      returnsNormally,
    );
  });
}

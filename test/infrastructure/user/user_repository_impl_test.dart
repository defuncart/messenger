import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/common/repositories/date_time/date_time_generator.dart';
import 'package:messenger/domain/user/entity/user_entity.dart';
import 'package:messenger/infrastructure/user/user_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../test_utils.dart';

void main() {
  group('$UserRepositoryImpl', () {
    late FirebaseFirestore fakeFirebaseFirestore;
    late DateTimeGenerator mockDateTimeGenerator;
    late UserRepositoryImpl userRepositoryImpl;

    setUp(() {
      fakeFirebaseFirestore = FakeFirebaseFirestore();
      mockDateTimeGenerator = MockDateTimeGenerator();
      userRepositoryImpl = UserRepositoryImpl(
        firebaseFirestore: fakeFirebaseFirestore,
        dateTimeGenerator: mockDateTimeGenerator,
      );
    });

    test('createUser', () async {
      final now = DateTime(1);
      when(() => mockDateTimeGenerator.nowUtc).thenReturn(now);

      const id = 'id';
      const phoneNumber = 'phoneNumber';
      const displayName = 'displayName';

      final user = await userRepositoryImpl.createUser(
        id: id,
        phoneNumber: phoneNumber,
        displayName: displayName,
      );

      expect(
        user,
        TestEntities.user(
          id: id,
          phoneNumber: phoneNumber,
          displayName: displayName,
        ),
      );

      final snapshot = await fakeFirebaseFirestore.collection('users').doc(id).get();

      expect(
        snapshot.data(),
        {
          'id': 'id',
          'phoneNumber': 'phoneNumber',
          'displayName': 'displayName',
          'avatarUrl': null,
          'createdAt': '0001-01-01T00:00:00.000',
          'updatedAt': '0001-01-01T00:00:00.000',
        },
      );
    });

    group('getUser', () {
      const id = 'id';

      test('when no user in db, expect $UserNotFoundFailure failure', () async {
        final user = await userRepositoryImpl.getUser(id: id);
        expect(user, UserEntity.failure(UserNotFoundFailure()));
      });

      test('when user data in db is not valid, expect $UserCouldNotBeParsedFailure failure', () async {
        await fakeFirebaseFirestore.collection('users').doc(id).set({});
        final user = await userRepositoryImpl.getUser(id: id);
        expect(user, UserEntity.failure(UserCouldNotBeParsedFailure()));
      });

      test('when user in db, expect entity', () async {
        await fakeFirebaseFirestore.collection('users').doc(id).set({
          'id': 'id',
          'phoneNumber': 'phoneNumber',
          'displayName': 'displayName',
          'avatarUrl': null,
          'createdAt': '0001-01-01T00:00:00.000',
          'updatedAt': '0001-01-01T00:00:00.000',
        });

        final user = await userRepositoryImpl.getUser(id: id);

        expect(user, TestEntities.user());
      });
    });

    group('deleteUser', () {
      const id = 'id';

      test('when user in db, expect removal', () async {
        await fakeFirebaseFirestore.collection('users').doc(id).set({
          'id': 'id',
          'phoneNumber': 'phoneNumber',
          'displayName': 'displayName',
          'avatarUrl': null,
          'createdAt': '0001-01-01T00:00:00.000',
          'updatedAt': '0001-01-01T00:00:00.000',
        });

        var snapshot = await fakeFirebaseFirestore.collection('users').doc(id).get();
        expect(snapshot.exists, isTrue);

        await userRepositoryImpl.deleteUser(id: id);

        snapshot = await fakeFirebaseFirestore.collection('users').doc(id).get();
        expect(snapshot.exists, isFalse);
      });
    });
  });
}

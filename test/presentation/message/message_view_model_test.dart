import 'package:flutter_test/flutter_test.dart';
import 'package:messenger/domain/message/entity/message_entity.dart';
import 'package:messenger/presentation/message/message_view_model.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';
import '../../test_utils.dart';

void main() {
  group('$MessageViewModel', () {
    late MockGetAuthUserIdUseCase mockGetAuthUserIdUseCase;
    late MessageViewModel viewModel;

    setUp(() {
      mockGetAuthUserIdUseCase = MockGetAuthUserIdUseCase();
      viewModel = MessageViewModel(
        getAuthUserIdUseCase: mockGetAuthUserIdUseCase,
      );
    });

    test('When entity has failure, expect hasError isTrue', () {
      final entity = MessageEntity.failure(MessageNotFoundFailure());
      viewModel.initialize(entity);

      expect(viewModel.hasError, isTrue);
      verifyNever(() => mockGetAuthUserIdUseCase());
    });

    group('When entity has value', () {
      const text = 'text';
      final createdAt = DateTime(1);

      setUp(() {
        final entity = TestEntities.message(
          text: text,
          createdAt: createdAt,
        );
        when(() => mockGetAuthUserIdUseCase()).thenReturn('');
        viewModel.initialize(entity);
      });

      test('expect hasError isFalse', () {
        expect(viewModel.hasError, isFalse);
        verify(() => mockGetAuthUserIdUseCase());
      });

      test('expect text, createdAt have values', () {
        expect(viewModel.text, text);
        expect(viewModel.createdAt, createdAt);
        verify(() => mockGetAuthUserIdUseCase());
      });
    });

    group('when auth user created message', () {
      const userId = 'userId';

      setUp(() {
        final entity = TestEntities.message(
          createdBy: userId,
        );
        when(() => mockGetAuthUserIdUseCase()).thenReturn(userId);
        viewModel.initialize(entity);
      });

      test('expect createdByUser isTrue', () {
        expect(viewModel.createdByUser, isTrue);
        expect(viewModel.canBeEdited, isTrue);
        expect(viewModel.canBeDeleted, isTrue);
        verify(() => mockGetAuthUserIdUseCase());
      });
    });

    group('when auth user did not create message', () {
      const userId = 'userId';
      const createdBy = 'createdBy';

      setUp(() {
        final entity = TestEntities.message(
          createdBy: createdBy,
        );
        when(() => mockGetAuthUserIdUseCase()).thenReturn(userId);
        viewModel.initialize(entity);
      });

      test('expect createdByUser isFalse', () {
        expect(viewModel.createdByUser, isFalse);
        expect(viewModel.canBeEdited, isFalse);
        expect(viewModel.canBeDeleted, isFalse);
        verify(() => mockGetAuthUserIdUseCase());
      });
    });
  });
}

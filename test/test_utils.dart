import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:messenger/domain/auth/entity/auth_entity.dart';
import 'package:messenger/domain/auth/entity/verification_code_entity.dart';
import 'package:messenger/domain/chat/entity/chat_entity.dart';
import 'package:messenger/domain/message/entity/message_entity.dart';
import 'package:messenger/domain/user/entity/user_entity.dart';
import 'package:messenger/infrastructure/chat/dto/chat_dto.dart';
import 'package:messenger/infrastructure/message/dto/message_dto.dart';
import 'package:messenger/infrastructure/user/dto/user_dto.dart';

/// Wraps [widget] with in [MaterialApp]
Widget wrapWithMaterialApp(Widget widget) => MaterialApp(home: widget);

/// Wraps [widget] with in [MaterialApp] while also setting en as locale
Widget wrapWithMaterialAppLocalizationDelegates(Widget widget) => MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: const Locale('en'),
      home: widget,
    );

/// A test util to create entity instances for testing
class TestEntities {
  TestEntities._();

  /// Returns a [UserEntity] model with given overriden parameters
  static UserEntity user({
    String? id,
    String? phoneNumber,
    String? displayName,
    String? avatarUrl,
  }) =>
      UserEntity.value(
        TestValueObjects.user(
          id: id ?? 'id',
          phoneNumber: phoneNumber ?? 'phoneNumber',
          displayName: displayName ?? 'displayName',
          avatarUrl: avatarUrl,
        ),
      );

  /// Returns a [MessageEntity] model with given overriden parameters
  static MessageEntity message({
    String? id,
    String? text,
    String? createdBy,
    DateTime? createdAt,
    bool? isEdited,
    bool? isDeleted,
  }) =>
      MessageEntity.value(
        TestValueObjects.message(
          id: id,
          text: text,
          createdBy: createdBy,
          createdAt: createdAt,
          isEdited: isEdited,
          isDeleted: isDeleted,
        ),
      );

  /// Returns a [ChatEntity] model with given overriden parameters
  static ChatEntity chat({
    String? id,
    List<String>? messages,
    String? title,
    List<String>? userIds,
    String? createdBy,
    bool? isDeleted,
  }) =>
      ChatEntity.value(
        TestValueObjects.chat(
          id: id,
          messages: messages,
          title: title,
          userIds: userIds,
          createdBy: createdBy,
          isDeleted: isDeleted,
        ),
      );

  /// Returns a [VerificationCodeEntity] model with given overriden parameters
  static VerificationCodeEntity verificationCode({
    String? id,
  }) =>
      VerificationCodeEntity.value(
        TestValueObjects.verificationCode(
          id: id,
        ),
      );

  /// Returns a [AuthEntity] model with given overriden parameters
  static AuthEntity auth({
    bool? authenticatedSuccessfully,
  }) =>
      AuthEntity.value(
        TestValueObjects.auth(
          authenticatedSuccessfully: authenticatedSuccessfully,
        ),
      );
}

/// A test util to create value object instances for testing
class TestValueObjects {
  TestValueObjects._();

  /// Returns a [UserValueObject] model with given overriden parameters
  static UserValueObject user({
    String? id,
    String? phoneNumber,
    String? displayName,
    String? avatarUrl,
  }) =>
      UserValueObject(
        id: id ?? 'id',
        phoneNumber: phoneNumber ?? 'phoneNumber',
        displayName: displayName ?? 'displayName',
        avatarUrl: avatarUrl,
      );

  /// Returns a [MessageValueObject] model with given overriden parameters
  static MessageValueObject message({
    String? id,
    String? text,
    String? createdBy,
    DateTime? createdAt,
    bool? isEdited,
    bool? isDeleted,
  }) =>
      MessageValueObject(
        id: id ?? 'id',
        text: text ?? 'text',
        createdBy: createdBy ?? 'createdBy',
        createdAt: createdAt ?? DateTime(1),
        isEdited: isEdited ?? false,
        isDeleted: isDeleted ?? false,
      );

  /// Returns a [ChatValueObject] model with given overriden parameters
  static ChatValueObject chat({
    String? id,
    String? title,
    List<String>? userIds,
    List<String>? messages,
    String? createdBy,
    bool? isDeleted,
  }) =>
      ChatValueObject(
        id: id ?? 'id',
        messages: messages ?? [],
        title: title ?? '',
        userIds: userIds ?? [],
        createdBy: createdBy ?? 'createdBy',
        isDeleted: isDeleted ?? false,
      );

  /// Returns a [VerificationCodeValueObject] model with given overriden parameters
  static VerificationCodeValueObject verificationCode({
    String? id,
    int? resendToken,
  }) =>
      VerificationCodeValueObject(
        id: id ?? 'id',
        resendToken: resendToken ?? 0,
      );

  /// Returns a [AuthValueObject] model with given overriden parameters
  static AuthValueObject auth({
    bool? authenticatedSuccessfully,
  }) =>
      AuthValueObject(
        authenticatedSuccessfully: authenticatedSuccessfully ?? true,
      );
}

/// A test util to create dto instances for testing
class TestDtos {
  TestDtos._();

  /// Returns a [UserDto] model with given overriden parameters
  static UserDto user({
    String? id,
    String? phoneNumber,
    String? displayName,
    String? avatarUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserDto(
        id: id ?? 'id',
        phoneNumber: phoneNumber ?? 'phoneNumber',
        displayName: displayName ?? 'displayName',
        avatarUrl: avatarUrl,
        createdAt: createdAt ?? DateTime(1),
        updatedAt: updatedAt ?? DateTime(1),
      );

  /// Returns a [MessageDto] model with given overriden parameters
  static MessageDto message({
    String? id,
    String? text,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) =>
      MessageDto(
        id: id ?? 'id',
        text: text ?? 'text',
        createdBy: createdBy ?? 'createdBy',
        createdAt: createdAt ?? DateTime(1),
        updatedAt: updatedAt,
        deletedAt: deletedAt,
      );

  /// Returns a [ChatDto] model with given overriden parameters
  static ChatDto chat({
    String? id,
    String? title,
    List<String>? userIds,
    List<String>? messages,
    String? createdBy,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) =>
      ChatDto(
        id: id ?? 'id',
        userIds: userIds ?? [],
        title: title ?? '',
        messages: messages ?? [],
        createdBy: createdBy ?? 'createdBy',
        createdAt: createdAt ?? DateTime(1),
        updatedAt: updatedAt,
        deletedAt: deletedAt,
      );
}

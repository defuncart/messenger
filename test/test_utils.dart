import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:messenger/domain/auth/entity/auth_entity.dart';
import 'package:messenger/domain/auth/entity/verification_code_entity.dart';
import 'package:messenger/domain/user/entity/user_entity.dart';
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
}

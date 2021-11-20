import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:messenger/domain/user/entity/user_entity.dart';

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
}

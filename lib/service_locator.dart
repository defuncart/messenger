import 'package:get_it/get_it.dart';
import 'package:messenger/common/repositories/date_time/date_time_generator.dart';
import 'package:messenger/common/repositories/id/id_generator.dart';
import 'package:messenger/domain/auth/auth_repository.dart';
import 'package:messenger/domain/chat/chat_repository.dart';
import 'package:messenger/domain/message/message_repository.dart';
import 'package:messenger/domain/user/user_respository.dart';
import 'package:messenger/infrastructure/auth/auth_repository_impl.dart';
import 'package:messenger/infrastructure/chat/chat_repository_impl.dart';
import 'package:messenger/infrastructure/message/message_respository_impl.dart';
import 'package:messenger/infrastructure/user/user_repository_impl.dart';
import 'package:meta/meta.dart';

class ServiceLocator {
  ServiceLocator._();

  /// Initializes all singletons
  ///
  /// Should be called once before app launches
  static void initialize() {
    GetIt.instance
      ..registerSingleton<DateTimeGenerator>(DateTimeGeneratorImpl())
      ..registerSingleton<IdGenerator>(IdGeneratorImpl())
      ..registerSingleton<AuthRepository>(AuthRepositoryImpl())
      ..registerSingleton<UserRepository>(
        UserRepositoryImpl(
          dateTimeGenerator: get<DateTimeGenerator>(),
        ),
      )
      ..registerSingleton<MessageRepository>(
        MessageRepositoryImpl(
          dateTimeGenerator: get<DateTimeGenerator>(),
          idGenerator: get<IdGenerator>(),
        ),
      )
      ..registerSingleton<ChatRepository>(
        ChatRepositoryImpl(
          dateTimeGenerator: get<DateTimeGenerator>(),
          idGenerator: get<IdGenerator>(),
        ),
      );
  }

  /// Retrieves an instance of a registered type [T]
  static T get<T extends Object>() => GetIt.instance.get<T>();

  /// Registers an object of type [T] in a test
  ///
  /// Should be used in `setUp`
  @visibleForTesting
  static void testRegister<T extends Object>(T object) => GetIt.instance.registerSingleton<T>(object);

  /// Resets all registered singletons
  ///
  /// Should be used in `tearDown`
  @visibleForTesting
  static void reset() => GetIt.instance.reset();
}

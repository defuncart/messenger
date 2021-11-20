import 'package:messenger/domain/user/entity/user_entity.dart';
import 'package:messenger/infrastructure/user/dto/user_dto.dart';

extension UserDtoExtensions on UserDto {
  UserValueObject toValueObject() => UserValueObject(
        id: id,
        phoneNumber: phoneNumber,
        displayName: displayName,
        avatarUrl: avatarUrl,
      );
}

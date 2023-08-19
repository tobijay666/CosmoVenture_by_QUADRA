import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<void> signUp(UserEntity user);
  Future<void> signIn(UserEntity user);
}

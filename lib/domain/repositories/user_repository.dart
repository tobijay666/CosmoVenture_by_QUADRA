import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<void> signUp(UserEntity user);
  Future<String> signIn(UserEntity user);
  Future<String> getCurrentUserUid();
  Future<UserEntity> getUserDetails(String uid);
}

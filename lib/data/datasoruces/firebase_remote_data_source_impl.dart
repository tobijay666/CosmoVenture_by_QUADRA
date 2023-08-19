import 'dart:io';

import '../../domain/entities/user_entity.dart';

abstract class FirebaseRemoteDataSource {
  ///auth
  Future<void> signUp(UserEntity user);
  Future<void> signIn(UserEntity user);
}

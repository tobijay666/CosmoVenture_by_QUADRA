// ignore_for_file: file_names

import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class SignInUseCase {
  final UserRepository repository;
  SignInUseCase({required this.repository});

  Future<String> call(UserEntity user) async {
    return repository.signIn(user);
  }
}

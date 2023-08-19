// ignore_for_file: file_names

import 'package:cosmoventure/domain/repositories/user_repository.dart';

class SignUpUseCase {
  final UserRepository repository;
  SignUpUseCase({required this.repository});

  Future<void> call(user) async {
    return repository.signUp(user);
  }
}

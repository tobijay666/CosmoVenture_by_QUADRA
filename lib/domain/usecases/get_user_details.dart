import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUserDetailsUseCase {
  final UserRepository repository;
  GetUserDetailsUseCase({required this.repository});

  Future<UserEntity> call(String uid) async {
    return repository.getUserDetails(uid);
  }
}

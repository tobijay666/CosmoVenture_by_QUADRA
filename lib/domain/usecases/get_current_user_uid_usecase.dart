import '../repositories/user_repository.dart';

class GetCurrentUserUidUseCase {
  final UserRepository repository;
  GetCurrentUserUidUseCase({required this.repository});

  Future<String> call() async {
    return repository.getCurrentUserUid();
  }
}

import 'package:cosmoventure/domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasoruces/firebase_remote_data_source_impl.dart';

class UserRepositoryImpl extends UserRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> signUp(UserEntity user) async => remoteDataSource.signUp(user);

  @override
  Future<String> signIn(UserEntity user) async => remoteDataSource.signIn(user);

  @override
  Future<String> getCurrentUserUid() async =>
      remoteDataSource.getCurrentUserUid();

  @override
  Future<UserEntity> getUserDetails(String uid) async =>
      remoteDataSource.getUserDetails(uid);
}

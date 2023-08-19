import 'package:cosmoventure/domain/entities/destination_entity.dart';
import 'package:cosmoventure/domain/repositories/destination_repository.dart';

import '../datasoruces/firebase_remote_data_source_impl.dart';

class DestinationRepositoryImpl extends DestinationRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  DestinationRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<DestinationEntity>> getDestinationCards() async =>
      remoteDataSource.getDestinationCards();
}

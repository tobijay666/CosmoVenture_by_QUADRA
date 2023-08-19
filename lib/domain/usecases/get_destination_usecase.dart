import 'package:cosmoventure/domain/entities/destination_entity.dart';

import '../repositories/destination_repository.dart';

class GetDestinationUseCase {
  final DestinationRepository repository;
  GetDestinationUseCase({required this.repository});

  Future<List<DestinationEntity>> call() async {
    return repository.getDestinationCards();
  }
}

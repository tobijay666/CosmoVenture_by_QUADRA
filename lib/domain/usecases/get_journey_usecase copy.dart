import 'package:cosmoventure/domain/entities/destination_entity.dart';

import '../entities/journey_entity copy.dart';
import '../repositories/destination_repository.dart';

class GetJourneyUseCase {
  final DestinationRepository repository;
  GetJourneyUseCase({required this.repository});

  Future<List<JourneyEntity>> call() async {
    return repository.getJourneyCards();
  }
}

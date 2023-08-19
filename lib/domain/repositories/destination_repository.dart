import 'package:cosmoventure/domain/entities/journey_entity%20copy.dart';

import '../entities/destination_entity.dart';

abstract class DestinationRepository {
  Future<List<DestinationEntity>> getDestinationCards();
  Future<List<JourneyEntity>> getJourneyCards();
}

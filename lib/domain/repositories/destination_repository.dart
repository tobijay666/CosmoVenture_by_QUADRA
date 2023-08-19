import '../entities/destination_entity.dart';

abstract class DestinationRepository {
  Future<List<DestinationEntity>> getDestinationCards();
}

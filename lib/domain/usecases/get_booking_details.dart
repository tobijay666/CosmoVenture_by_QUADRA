import '../entities/booking_entity.dart';
import '../entities/user_entity.dart';
import '../repositories/booking_repository.dart';
import '../repositories/user_repository.dart';

class GetBookingDetailsUseCase {
  final BookingRepository repository;
  GetBookingDetailsUseCase({required this.repository});

  Future<BookingEntity> call(String uid) async {
    return repository.getBookingDetails(uid);
  }
}

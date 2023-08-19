import 'package:cosmoventure/domain/entities/journey_entity%20copy.dart';
import 'package:cosmoventure/domain/entities/payment_entity.dart';

import '../entities/booking_entity.dart';
import '../entities/destination_entity.dart';

abstract class BookingRepository {
  Future<String> addBooking(BookingEntity bookingEntity);
  Future<String> addPayment(PaymentEntity paymentEntity);
  Future<BookingEntity> getBookingDetails(String uid);
}

import 'package:cosmoventure/domain/entities/booking_entity.dart';
import 'package:cosmoventure/domain/entities/destination_entity.dart';
import 'package:cosmoventure/domain/entities/journey_entity%20copy.dart';
import 'package:cosmoventure/domain/entities/payment_entity.dart';
import 'package:cosmoventure/domain/repositories/destination_repository.dart';

import '../../domain/repositories/booking_repository.dart';
import '../datasoruces/firebase_remote_data_source_impl.dart';

class BookingRepositoryImpl extends BookingRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  BookingRepositoryImpl({required this.remoteDataSource});

  @override
  Future<String> addBooking(BookingEntity bookingEntity) async =>
      remoteDataSource.addBooking(bookingEntity);

  @override
  Future<BookingEntity> getBookingDetails(String uid) async =>
      remoteDataSource.getBookingDetails(uid);

  @override
  Future<String> addPayment(PaymentEntity paymentEntity) async =>
      remoteDataSource.addPayment(paymentEntity);
}

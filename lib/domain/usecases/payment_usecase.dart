// ignore_for_file: file_names

import 'package:cosmoventure/domain/entities/booking_entity.dart';
import 'package:cosmoventure/domain/repositories/user_repository.dart';

import '../repositories/booking_repository.dart';

class PaymentUseCase {
  final BookingRepository repository;
  PaymentUseCase({required this.repository});

  Future<String> call(paymentEntity) async {
    return repository.addPayment(paymentEntity);
  }
}

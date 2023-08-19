import 'package:bloc/bloc.dart';
import 'package:cosmoventure/domain/entities/booking_entity.dart';
import 'package:cosmoventure/domain/usecases/booking_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../utils/app_strings.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingUseCase? bookingUseCase;
  BookingBloc({this.bookingUseCase}) : super(BookingInitial()) {
    on<BookingLoading>(_onBookingLoading);
    on<BookingEventRequested>(_onBookingEventRequested);
    on<BookingAdded>(_onBookingAdded);
  }
  Future<void> _onBookingLoading(
      BookingLoading event, Emitter<BookingState> emit) async {
    return emit(BookingLoaded());
  }

  Future<void> _onBookingAdded(
      BookingAdded event, Emitter<BookingState> emit) async {
    return emit(BookingPay());
  }

  Future<void> _onBookingEventRequested(
      BookingEventRequested event, Emitter<BookingState> emit) async {
    if (event.id.isEmpty ||
        event.date.isEmpty ||
        event.arrival.isEmpty ||
        event.destination.isEmpty ||
        event.departure.isEmpty) {
      return emit(BookingError(
        errorTitle: AppStrings.emptyFieldsErrorTitle,
        errorDesc: AppStrings.emptyFields,
      ));
    } else {
      final bookingEntity = BookingEntity(
        id: event.id,
        arrival: event.arrival,
        price: event.price,
        date: event.date,
        time: event.time,
        departure: event.departure,
        destination: event.destination,
        passengerCount: event.passengerCount,
      );
      String bookingId = await bookingUseCase!.call(bookingEntity);
      return emit(BookingSuccess(
        bookingId: bookingId,
        successTitle: "Booking Added Successfully",
        successDesc: "Please do the payement to confirm booking",
      ));
    }
  }
}

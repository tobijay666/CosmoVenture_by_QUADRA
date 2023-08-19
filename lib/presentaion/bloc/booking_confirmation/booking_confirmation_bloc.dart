import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'booking_confirmation_event.dart';
part 'booking_confirmation_state.dart';

class BookingConfirmationBloc
    extends Bloc<BookingConfirmationEvent, BookingConfirmationState> {
  BookingConfirmationBloc() : super(BookingConfirmationInitial()) {
    on<BookingConfirmationLoading>(_onBookingConfirmationLoading);
    on<BookingConfirmationComplete>(_onBookingConfirmationComplete);
  }
  Future<void> _onBookingConfirmationLoading(BookingConfirmationLoading event,
      Emitter<BookingConfirmationState> emit) async {
    return emit(BookingConfirmationLoaded());
  }

  Future<void> _onBookingConfirmationComplete(BookingConfirmationComplete event,
      Emitter<BookingConfirmationState> emit) async {
    return emit(BookingConfirmationSuccess());
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'walkthrough_event.dart';
part 'walkthrough_state.dart';

class WalkthroughBloc extends Bloc<WalkthroughEvent, WalkthroughState> {
  WalkthroughBloc() : super(WalkthroughInitial()) {
    on<WalkthroughEvent>((event, emit) {});
  }
}

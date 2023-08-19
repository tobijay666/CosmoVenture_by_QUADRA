import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/destination_entity.dart';
import '../../../domain/usecases/get_destination_usecase.dart';

part 'discover_event.dart';
part 'discover_state.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final GetDestinationUseCase? getDestinationUseCase;
  DiscoverBloc({this.getDestinationUseCase}) : super(DiscoverInitial()) {
    on<DiscoverLoading>(_onDiscoverLoading);
  }
  Future<void> _onDiscoverLoading(
      DiscoverEvent event, Emitter<DiscoverState> emit) async {
    List<DestinationEntity> destinationCards =
        await getDestinationUseCase!.call();

    return emit(DiscoverLoaded(
      destinationCards: destinationCards,
    ));
  }
}

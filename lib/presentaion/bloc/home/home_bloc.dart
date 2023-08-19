import 'package:bloc/bloc.dart';
import 'package:cosmoventure/domain/entities/destination_entity.dart';
import 'package:cosmoventure/domain/entities/journey_entity%20copy.dart';
import 'package:cosmoventure/domain/usecases/get_destination_usecase.dart';
import 'package:cosmoventure/domain/usecases/get_journey_usecase%20copy.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetDestinationUseCase? getDestinationUseCase;
  final GetJourneyUseCase? getJourneyUseCase;
  HomeBloc({this.getJourneyUseCase, this.getDestinationUseCase})
      : super(HomeInitial()) {
    on<HomeLoading>(_onHomeLoading);
  }

  Future<void> _onHomeLoading(HomeEvent event, Emitter<HomeState> emit) async {
    List<DestinationEntity> destinationCards =
        await getDestinationUseCase!.call();
    List<JourneyEntity> journeyCards = await getJourneyUseCase!.call();
    print(journeyCards);
    return emit(HomeLoaded(
        destinationCards: destinationCards, journeyCards: journeyCards));
  }
}

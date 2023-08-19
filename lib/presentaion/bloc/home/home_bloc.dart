import 'package:bloc/bloc.dart';
import 'package:cosmoventure/domain/usecases/get_destination_usecase.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetDestinationUseCase? getDestinationUseCase;
  HomeBloc({this.getDestinationUseCase}) : super(HomeInitial()) {
    on<HomeLoading>(_onHomeLoading);
  }

  Future<void> _onHomeLoading(HomeEvent event, Emitter<HomeState> emit) async {
    return emit(HomeLoaded());
  }
}

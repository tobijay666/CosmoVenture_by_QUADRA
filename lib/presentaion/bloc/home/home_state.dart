part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoaded extends HomeState {
  final List<DestinationEntity>? destinationCards;
  final List<JourneyEntity>? journeyCards;
  const HomeLoaded({this.journeyCards, this.destinationCards});
}

part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class SettingsLoading extends SettingsEvent {
  final String uid;

  const SettingsLoading({required this.uid});
}

class LogoutEvent extends SettingsEvent {}

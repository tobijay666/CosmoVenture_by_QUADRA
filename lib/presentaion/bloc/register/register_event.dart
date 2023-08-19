part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterEventRequested extends RegisterEvent {
  final String iId;
  final String name;
  final String password;
  final String cPassword;

  const RegisterEventRequested(
      {required this.name,
      required this.cPassword,
      required this.iId,
      required this.password});
}

class RegisterLoading extends RegisterEvent {}

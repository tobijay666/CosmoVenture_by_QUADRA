part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterError extends RegisterState {
  final String errorTitle;
  final String? errorDesc;

  const RegisterError({required this.errorTitle, this.errorDesc});
}

class RegisterSuccess extends RegisterState {
  final String successTitle;
  final String? successDesc;
  const RegisterSuccess({required this.successTitle, this.successDesc});
}

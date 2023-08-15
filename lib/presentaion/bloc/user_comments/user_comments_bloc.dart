import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_comments_event.dart';
part 'user_comments_state.dart';

class UserCommentsBloc extends Bloc<UserCommentsEvent, UserCommentsState> {
  UserCommentsBloc() : super(UserCommentsInitial()) {
    on<UserCommentsEvent>((event, emit) {});
  }
}

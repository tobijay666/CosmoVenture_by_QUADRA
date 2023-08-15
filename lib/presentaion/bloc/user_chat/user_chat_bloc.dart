import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_chat_event.dart';
part 'user_chat_state.dart';

class UserChatBloc extends Bloc<UserChatEvent, UserChatState> {
  UserChatBloc() : super(UserChatInitial()) {
    on<UserChatEvent>((event, emit) {});
  }
}

import 'package:bloc_demo/bloc/user_event.dart';
import 'package:bloc_demo/bloc/user_state.dart';
import 'package:bloc_demo/dataLayer/repository.dart';
import 'package:bloc_demo/models/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final Repo repo;
  UserBloc(this.repo) : super(UserLoading()) {
    on<GetUser>((event, emit) async {
      emit(UserLoading());
      try {
        List<User> userList = await repo.getData();
        print("calling api done");
        emit(UserLoaded(userList));
      } catch (e) {
        emit(UserLoadingError(e.toString()));
      }
    });
  }
}

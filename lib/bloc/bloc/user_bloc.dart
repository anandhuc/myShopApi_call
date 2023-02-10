import 'package:api_bloc/model/user_model.dart';
import 'package:api_bloc/repos/repos.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepo _userRepo;
  UserBloc(this._userRepo) : super(UserLoadingState()) {
    on<LoadUserEvent>((event, emit) async {
      emit(UserLoadingState());
      
     try{
      final users = await _userRepo.getUsers();
       emit(UserLoadedState(users));
     }catch(e){
      emit(errorState(e.toString()));
     }
    
    });
  }
}

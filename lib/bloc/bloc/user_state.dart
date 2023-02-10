part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  
  
  
}
// data loading stste
class UserLoadingState extends UserState{

@override
  List<Object> get props => [];
}

class UserLoadedState extends UserState{
UserLoadedState(this.users);
  final List<Products> users;

@override
  List<Object> get props => [users];
}
class errorState extends UserState{
 errorState(this.error);
  final String error; 

@override
  List<Object> get props => [error];
}

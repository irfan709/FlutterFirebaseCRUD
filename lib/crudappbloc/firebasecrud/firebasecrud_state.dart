part of 'firebasecrud_bloc.dart';

abstract class FirebasecrudState extends Equatable {
  const FirebasecrudState();
}

class FirebasecrudInitial extends FirebasecrudState {
  @override
  List<Object> get props => [];
}

class FirebasecrudLoading extends FirebasecrudState {
  @override
  List<Object> get props => [];
}

class FirebasecrudLoaded extends FirebasecrudState {
  final List<User> users;

  FirebasecrudLoaded(this.users);

  @override
  List<Object> get props => [users];
}

class FirebasecrudFailure extends FirebasecrudState {
  @override
  List<Object> get props => [];
}

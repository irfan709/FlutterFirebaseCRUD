part of 'crudfirebase_cubit.dart';

abstract class CrudfirebaseState extends Equatable {
  const CrudfirebaseState();
}

class CrudfirebaseInitial extends CrudfirebaseState {
  @override
  List<Object> get props => [];
}

class CrudfirebaseLoading extends CrudfirebaseState {
  @override
  List<Object> get props => [];
}

class CrudfirebaseLoaded extends CrudfirebaseState {
  final List<User> users;

  CrudfirebaseLoaded(this.users);
  @override
  List<Object> get props => [users];
}

class CrudfirebaseFailure extends CrudfirebaseState {
  @override
  List<Object> get props => [];
}

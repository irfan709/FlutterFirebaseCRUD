part of 'firebasecrud_bloc.dart';

abstract class FirebasecrudEvent extends Equatable {
  const FirebasecrudEvent();
}

class ReadDataEvent extends FirebasecrudEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class LoadDataEvent extends FirebasecrudEvent {
  final List<User> users;

  LoadDataEvent(this.users);

  @override
  List<Object?> get props => [users];
}

class CreateDataEvent extends FirebasecrudEvent {
  final User user;

  CreateDataEvent(this.user);

  @override
  List<Object?> get props => [user];
}

class UpdateDataEvent extends FirebasecrudEvent {
  final User user;

  UpdateDataEvent(this.user);

  @override
  List<Object?> get props => [user];
}

class DeleteDataEvent extends FirebasecrudEvent {
  final String id;

  DeleteDataEvent(this.id);

  @override
  List<Object?> get props => [id];
}

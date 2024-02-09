import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_firebase/database/database_handler.dart';

import '../../model/user.dart';

part 'firebasecrud_event.dart';

part 'firebasecrud_state.dart';

class FirebasecrudBloc extends Bloc<FirebasecrudEvent, FirebasecrudState> {
  StreamSubscription<List<User>>? _userStreamSubscription;

  @override
  Future<void> close() async {
    await _userStreamSubscription!.cancel();
    return super.close();
  }

  FirebasecrudBloc() : super(FirebasecrudInitial()) {

    on<ReadDataEvent>((event, emit) {
      try {
        emit(FirebasecrudLoading());
        final streamResponse = DatabaseHandler.readData();
        _userStreamSubscription?.cancel();
        _userStreamSubscription = streamResponse.listen((users) {
          add(LoadDataEvent(users));
        });
      } catch (e) {
        emit(FirebasecrudFailure());
      }
    });

    on<LoadDataEvent>((event, emit) {
      try {
        emit(FirebasecrudLoaded(event.users));
      } catch (_) {
        emit(FirebasecrudFailure());
      }
    });

    on<CreateDataEvent>((event, emit) {
      try {
        if (state is FirebasecrudLoaded) {
          DatabaseHandler.createUser(event.user);
        }
      } catch (_) {
        emit(FirebasecrudFailure());
      }
    });

    on<UpdateDataEvent>((event, emit) {
      try {
        if (state is FirebasecrudLoaded) {
          DatabaseHandler.updateData(event.user);
        }
      } catch (_) {
        emit(FirebasecrudFailure());
      }
    });

    on<DeleteDataEvent>((event, emit) {
      try {
        if (state is FirebasecrudLoaded) {
          DatabaseHandler.deleteData(event.id);
        }
      } catch (_) {
        emit(FirebasecrudFailure());
      }
    });
  }
}

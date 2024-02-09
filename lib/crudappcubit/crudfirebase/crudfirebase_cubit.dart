import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_firebase/database/database_handler.dart';

import '../../model/user.dart';

part 'crudfirebase_state.dart';

class CrudfirebaseCubit extends Cubit<CrudfirebaseState> {
  CrudfirebaseCubit() : super(CrudfirebaseInitial());

  void readData() {
    try {
      emit(CrudfirebaseLoading());
      final streamResponse = DatabaseHandler.readData();
      streamResponse.listen((users) {
        emit(CrudfirebaseLoaded(users));
      });
    } catch(e) {
      emit(CrudfirebaseFailure());
    }
  }

  void createData(User user) {
    if(state is CrudfirebaseLoaded) {
      DatabaseHandler.createUser(user);
    }
  }

  void updateData(User user) {
    if(state is CrudfirebaseLoaded) {
      DatabaseHandler.updateData(user);
    }
  }

  void deleteData(String id) {
    if(state is CrudfirebaseLoaded) {
      DatabaseHandler.deleteData(id);
    }
  }
}

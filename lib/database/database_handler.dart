import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/user.dart';

class DatabaseHandler {

  static createUser(User user) async {
    final userCollection = FirebaseFirestore.instance.collection("Users");
    String id = userCollection.doc().id;

    final newUser = User(
      id: id,
      username: user.username,
      email: user.email,
    ).toJson();

    await userCollection.doc(id).set(newUser);
  }

  static Stream<List<User>> readData() {
    final userCollection = FirebaseFirestore.instance.collection("Users");
    return userCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => User.fromSnapshot(e)).toList());
  }

  static updateData(User user) {
    final userCollection = FirebaseFirestore.instance.collection("Users");

    final newData =
    User(id: user.id, username: user.username, email: user.email).toJson();

    userCollection.doc(user.id).update(newData);
  }

  static deleteData(String id) {
    final userCollection = FirebaseFirestore.instance.collection("Users");

    userCollection.doc(id).delete();
  }

}
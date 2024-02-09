import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? id;
  final String? username;
  final String? email;

  User({this.id, this.username, this.email});

  static User fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return User(
        id: snapshot['id'],
        username: snapshot['username'],
        email: snapshot['email']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "email": email,
    };
  }
}
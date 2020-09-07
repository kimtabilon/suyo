import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:suyo/models/user.dart';

class UserService {
  final String uid;

  UserService({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection('user');
  final CollectionReference profileCollection = Firestore.instance.collection('profile');

  Future updateUser(
      String email,
      String password,
      String role,
      String firstName,
      String middleName,
      String lastName,
      String gender,
      String birthday,
      ) async
  {
    await userCollection.document(uid)
        .setData({
          'email': email,
          'password': password,
          'role': role
        }
    );

    await profileCollection.document(uid)
        .setData({
          'first_name': firstName,
          'middle_name': middleName,
          'last_name': lastName,
          'gender': gender,
          'birthday': birthday,
        }
    );

    return userCollection.document(uid);
  }

  /*Profile _profileDataFromSnapshot(DocumentSnapshot snapshot) {
    return Profile(
      firstName: snapshot.data['first_name'],
      middleName: snapshot.data['middle_name'],
      lastName: snapshot.data['last_name'],
      gender: snapshot.data['gender'],
      birthday: snapshot.data['birthday'],
    );
  }*/

  /*Stream<Profile> get profile {
    return userCollection.document(uid)
        .collection('profile')
        .document(uid)
        .snapshots()
        .map(_profileDataFromSnapshot);
  }*/

  User _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return User(
      uid: uid,
      email: snapshot.data['email'],
      role: snapshot.data['role'],
    );
  }

  Stream<User> get user {
    return userCollection.document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
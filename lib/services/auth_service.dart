import 'package:suyo/models/user_model.dart';
import 'package:suyo/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // CREATE USER OBJECT FROM FIREBASE USER
  UserModel _userFromFirebaseUser(FirebaseUser user) {
    if(user!=null) {
      return UserModel(uid:user.uid, email:user.email, role:'client');
    }
    return null;
  }

  // AUTH CHANGE USER STREAM
  Stream<UserModel> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  // SIGN IN USING FIREBASE EMAIL AND PASSWORD
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      return _userFromFirebaseUser(user);

    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // SIGN UP USING FIREBASE EMAIL AND PASSWORD
  Future signUpWithEmailAndPassword(
      String email,
      String password,
      String firstName,
      String middleName,
      String lastName,
      String phone,
      String gender,
      String birthday,
  ) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      await UserService(uid: user.uid)
          .updateUser(
            user.email,
            password,
            'client',
            firstName,
            middleName,
            lastName,
            phone,
            gender,
            birthday,
          );

      return _userFromFirebaseUser(user);

    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // SIGNOUT
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}
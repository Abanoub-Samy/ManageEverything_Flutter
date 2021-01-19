import 'package:firebase_auth/firebase_auth.dart';
import 'package:manage_everything/models/churchModel.dart';
import 'package:manage_everything/services/firestoreData.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ChurchModel _userFromFirebase(FirebaseUser user) {
    return user != null ? ChurchModel(churchName: user.uid) : null;
  }

  Stream<ChurchModel> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerAndCreateNewProject(
      String email, String password, String churchName) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      FirebaseUser user = result.user;
      await FireStoreData(userID: user.uid).createNewChurch(churchName);
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future createNewManager(String id, String name, String dateBirth,
      String address, String contact, String userName, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: userName.trim(), password: password.trim());
      FirebaseUser user = result.user;
      await FireStoreData(userID: user.uid).createNewManager(
          id, name, dateBirth, address, contact, userName, password);
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

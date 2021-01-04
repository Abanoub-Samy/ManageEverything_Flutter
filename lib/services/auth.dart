import 'package:firebase_auth/firebase_auth.dart';
import 'package:manage_everything/models/managerModels.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ManagerModel _userFromFirebase(FirebaseUser user){
    return user != null ? ManagerModel(user.uid) :null ;
  }
  Stream<ManagerModel> get user{
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }


  Future signIn() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email , String password ) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}

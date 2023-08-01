import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> register(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    
  }
}
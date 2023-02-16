
import 'package:firebase_auth/firebase_auth.dart';
import 'package:move_ticketing/data/user/firebase_user_repository.dart';

class FirebaseUserRepositoryIml implements FirebaseUserRepository {
  final FirebaseAuth _firebaseAuth;
  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  FirebaseUserRepositoryIml(this._firebaseAuth);

  @override
  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> registerWithEmail({required String fullName, required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
}
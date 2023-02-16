import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseUserRepository {
  Stream<User?> get authStateChanges;

  Future<void> signOut();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> registerWithEmail({
    required String fullName,
    required String email,
    required String password,
  });

  // Future<String> authenticate({
  //   required String email,
  //   required String password;
  // });
  //
  // Future<void> deleteToken();
  //
  // Future<void> persistToken({
  //   required String token
  // });
  //
  // Future<bool> hasToken();
}
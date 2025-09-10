import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oyelabs/features/auth/data/auth_repo.dart';
import 'package:oyelabs/features/auth/data/user_model.dart';
import 'package:oyelabs/utils/location.dart';

class AuthData implements AuthRepo {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final _userCollection = FirebaseFirestore.instance
      .collection("others")
      .doc("oyelabs")
      .collection("users");

  Future<void> _addUser({required UserModel user}) async {
    try {
      await _userCollection.doc(user.id).set(user.toJson());
    } catch (e) {
      throw Exception('Failed to add user: $e');
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw Exception('Google sign-in was cancelled');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _firebaseAuth
          .signInWithCredential(credential);

      final user = userCredential.user;
      if (user != null) {
        final userSnapshot = await _userCollection.doc(user.uid).get();
        if (!userSnapshot.exists) {
          final newUser = UserModel(
            id: user.uid,
            email: user.email ?? "",
            name: user.displayName ?? "",
            avatar: user.photoURL ?? "",
            bio: "",
            address: UserLocationModel(),
            creationTD: Timestamp.now(),
            deactivate: false,
          );
          await _addUser(user: newUser);
        }
      }
    } catch (e) {
      debugPrint('Failed to sign in with Google: $e');
      throw Exception('Failed to sign in with Google: $e');
    }
  }
}

import 'dart:developer';

import 'package:boularinfo/models/userDetails.dart';
import 'package:boularinfo/models/firebaseManager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginManager {
  UserCredential? credential;
  UserDetails? userDetails;

  LoginManager();

  Future<void> createAccount(String emailAddress, String password, String classe, name, surname) async {
    try {
      final value = await FirebaseManager.createAccount(emailAddress, password, classe, name, surname);
      if (value != null) {
        credential = value;
        userDetails = UserDetails(nom: surname, prenom: name, userUID: value.user?.uid ?? "", classe: classe, email: emailAddress, role: "Student");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
        //  TODO: handle error
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        //  TODO: handle error
      }
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      final cred = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      credential = cred;
      if (cred.user?.uid != null) {
        userDetails = await FirebaseManager.getAccount(cred.user!.uid);
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return "Cette email n'est lié à aucun compte.";
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return "Login incorrect, vérifiez l'email et le mot de passe";
      } else {
        return "Une erreur s'est produite lors de la connexion";
      }
    }
    return "Une erreur s'est produite lors de la connexion";
  }

  void logout() {
    FirebaseManager.logout();
    credential = null;
    userDetails = null;
  }
}

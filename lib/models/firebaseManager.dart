import 'dart:developer';

import 'package:boularinfo/models/userDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseManager {
  static Future<UserCredential?> createAccount(String emailAddress, String password, String classe, String name, String surname,) async {
    try {
      return FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((credentials) {
        String? uid = credentials.user?.uid;
        if (uid != null) {
          createUserOnLogin(uid, emailAddress, classe, name, surname);
        }
        return credentials;
      });
    } on FirebaseAuthException catch (e) {
      log("Firebase exception occured: $e");
      rethrow;
    }
  }

  static Future<UserDetails?> getAccount(String uid) {
    final docRef = FirebaseFirestore.instance.collection("userDetails").where("UserUID", isEqualTo: uid);
    return docRef.get().then(
          (QuerySnapshot<Map<String, dynamic>> querySnapshot) {
            if (querySnapshot.size == 0) {
              print("No data fetched");
              return null;
            }
            final accountData = querySnapshot.docs.first;
            try {
              final res = UserDetails.fromFBdoc(accountData.data());
              return res;
            } catch (e) {
              print("Error casting document to UserDetails: $e");
              return null;
            }
      },
      onError: (e) => print("Error getting document: $e"),
    );
  }

  static void logout() {
    FirebaseAuth.instance.signOut().onError((error, stackTrace) {
      log("There was an error while logging out: $error");
    });
  }

  static void createUserOnLogin(String uID, String emailAddress, String classe, String name, String surname) {
    final user = <String, String>{
      "UserUID": uID,
      "Nom": surname,
      "Prenom": name,
      "Classe": classe,
      "EmailAddress": emailAddress,
      "Role": "Student",
    };

    final db = FirebaseFirestore.instance;
    final alreadyThere = db.collection("userDetails").where("uid", isEqualTo: uID).get().then((value) {
      if (value.size != 0) {
        log("A user with the same UDID was already found in database");
        return;
      }
    });

    db
        .collection("userDetails")
        .add(user)
        .then((DocumentReference doc) => print('DocumentSnapshot added with ID: ${doc.id}'))
        .onError((error, stackTrace) => print('An error was thrown while creating document: $error'));
  }
}

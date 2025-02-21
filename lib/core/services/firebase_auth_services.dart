
import 'package:evently_app/core/services/snack_bar_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class FirebaseAuthService
{
  /// Firebase Auth
  static Future<bool> createAccount(String emailAddress, String password) async {
    EasyLoading.show();
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      SnackBarServices.showSuccessMessage('Account Created Successfully');
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        SnackBarServices.showErrorMessage(
            e.message.toString() ?? 'The password provided is too weak.');
        return Future.value(false);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        SnackBarServices.showErrorMessage(e.message.toString() ??
            'The account already exists for that email.');
        return Future.value(false);
      }
      SnackBarServices.showErrorMessage(
          e.message.toString() ?? 'Something went wrong');
      return Future.value(false);
    } catch (e) {
      print(e);
      SnackBarServices.showErrorMessage(e.toString() ?? 'Something went wrong');
      return Future.value(false);
    }
  }

  static Future<bool> loginAccount(String emailAddress, String password) async {
    EasyLoading.show();
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      SnackBarServices.showSuccessMessage('Logged In Successfully');
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        SnackBarServices.showErrorMessage(
            e.message.toString() ?? 'The password provided is too weak.');
        return Future.value(false);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        SnackBarServices.showErrorMessage(e.message.toString() ??
            'The account already exists for that email.');
        return Future.value(false);
      }
      SnackBarServices.showErrorMessage(
          e.message.toString() ?? 'Something went wrong');
      return Future.value(false);
    } catch (e) {
      print(e);
      SnackBarServices.showErrorMessage(e.toString() ?? 'Something went wrong');
      return Future.value(false);
    }
  }

  static  signInWithGoogle() async {
    EasyLoading.show();
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    // log(userCredential.user!.uid.toString());
  }

  static Future<void> logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print("Error logging out: $e");
      rethrow;
    }
  }
}
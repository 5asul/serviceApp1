import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController {
  Future<Either<Exception, UserCredential>> signInWithGoogle() async {
    try {

      
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return Left(Exception('Google sign-in aborted'));
      }


      final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;


      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );


      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);


      return Right(userCredential);
    } catch (e) {
      return Left(Exception('Error signing in with Google: $e'));
    }
  }
}


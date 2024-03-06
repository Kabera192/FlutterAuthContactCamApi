import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    // begin interactive sign in process, bring up the google screen
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // Obtain user details from the request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create credentials for user
    final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    // finally we sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

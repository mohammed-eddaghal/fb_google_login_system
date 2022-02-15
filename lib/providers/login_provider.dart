import 'package:fb_google_login/DTO/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginProvider with ChangeNotifier {
  // object
  var _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;
  UserDetails? userDetails;

  // fucntion for google login
  googleLogin(BuildContext context) async {
    this.googleSignInAccount = await _googleSignIn.signIn();
    // inserting values to our user details model

    if (googleSignInAccount != null) {
      this.userDetails = new UserDetails(
        displayName: this.googleSignInAccount!.displayName,
        email: this.googleSignInAccount!.email,
        photoURL: this.googleSignInAccount!.photoUrl,
        loginFb: false,
      );
      Navigator.pushReplacementNamed(context, '/home');
    }

    // call
    notifyListeners();
  }

  // function for facebook login
  facebooklogin(BuildContext context) async {
    var result = await FacebookAuth.i.login(
      permissions: ["public_profile", "email"],
    );

    // check the status of our login
    if (result.status == LoginStatus.success) {
      final requestData = await FacebookAuth.i.getUserData(
        fields: "email, name, picture",
      );

      this.userDetails = new UserDetails(
        displayName: requestData["name"],
        email: requestData["email"],
        photoURL: requestData["picture"]["data"]["url"] ?? " ",
        loginFb: true,
      );
      Navigator.pushReplacementNamed(context, '/home');
      notifyListeners();
    }
  }

  // logout

  logout(BuildContext context) async {
    if (userDetails!.loginFb == false)
      this.googleSignInAccount = await _googleSignIn.disconnect();
    //this.googleSignInAccount = await _googleSignIn.signOut();
    else
      await FacebookAuth.i.logOut();
    userDetails = null;
    print(userDetails);
    Navigator.pushReplacementNamed(context, '/');
    notifyListeners();
  }
}

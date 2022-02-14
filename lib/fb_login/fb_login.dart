import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FbLogin extends StatefulWidget {
  const FbLogin({Key? key}) : super(key: key);

  @override
  _FbLoginState createState() => _FbLoginState();
}

class _FbLoginState extends State<FbLogin> {
  bool _isLoggedIn = false;
  var _userObj;

  late final AccessToken accessToken;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _isLoggedIn
          ? Column(
              children: [
                Image.network(_userObj["picture"]["data"]["url"]),
                Text(_userObj["name"]),
                Text(_userObj["email"]),
                TextButton(onPressed: logOut, child: Text("log out")),
              ],
            )
          : Center(
              child: ElevatedButton(
                onPressed: FbLogin,
                child: Text('sing in with Fb'),
              ),
            ),
    );
  }

  Future<void> logOut() async {
    await FacebookAuth.instance.logOut();
    setState(() {
      _isLoggedIn = false;
      _userObj = null;
    });
  }

  Future<void> FbLogin() async {
// or FacebookAuth.i.accessToken
    final LoginResult result = await FacebookAuth.instance.login(
      //more permissions => https://developers.facebook.com/docs/permissions/reference
      permissions: ['public_profile', 'email'],
    ); // by default we request the email and the public profile
// or FacebookAuth.i.login()
    if (result.status == LoginStatus.success) {
      // you are logged
      final userData = await FacebookAuth.i.getUserData();
      setState(() {
        accessToken = result.accessToken!;
        _isLoggedIn = true;
        _userObj = userData;
        print("hhhhhhhhhhhhhhhhhhhhhhhhh  || $_userObj ||   $_isLoggedIn");
      });
    } else {
      print(result.status);
      print(result.message);
    }
  }
}

import 'package:fb_google_login/providers/google_signein_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatelessWidget {
  final FirebaseAuth fireBaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final user = fireBaseAuth.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('logged In'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(context, listen : false);
              provider.Googlelogut();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Profile"),
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Name: ' + user.displayName!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              'Email: ' + user.email!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:fb_google_login/providers/login_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoggedInPage extends StatelessWidget {
  final FirebaseAuth fireBaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //final user = fireBaseAuth.currentUser!;
    final provider = Provider.of<LoginProvider>(context, listen : false);
    print("hhhhhhhhhhhhhhhhhhhhhhhhh  Google 2|| ${provider.userDetails}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text('logged In home screen'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              final provider = Provider.of<LoginProvider>(context, listen : false);
              provider.logout(context);
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
              backgroundImage: NetworkImage(provider.userDetails!.photoURL!),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Name: ' + provider.userDetails!.displayName!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            Text(
              'Email: ' + provider.userDetails!.email!,
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

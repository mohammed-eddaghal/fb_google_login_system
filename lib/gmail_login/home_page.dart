import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'gmail_login.dart';
import 'loogin_page.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(stream:FirebaseAuth.instance.authStateChanges() ,
          builder: (context, snapshot) {
          if(snapshot.connectionState== ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }else if( snapshot.hasData) {
            return LoggedInWidget();
          } else if (snapshot.hasError) {
            return const Center(child: Text("something went wrong!"),);
          }

            return const GmailLogin();
          },
        ),

    );
  }

}
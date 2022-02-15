import 'package:fb_google_login/providers/login_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 70,),
              ElevatedButton(
                onPressed:() {
                  final provider = Provider.of<LoginProvider>(context, listen: false);
                  provider.facebooklogin(context);
                } ,
                child: Text('sing in with Fb'),
              ),
              ElevatedButton(
                onPressed: () {
                  final provider = Provider.of<LoginProvider>(context, listen: false);
                  provider.googleLogin(context);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child:
                  Text(
                    'Google',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }


}

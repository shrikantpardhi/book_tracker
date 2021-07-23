import 'package:book_tracker/screens/main_screen.dart';
import 'package:book_tracker/screens/main_screen.dart';
import 'package:book_tracker/widgets/BuildInputFieldDecoration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required GlobalKey<FormState> globalKey,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,
  })  : _globalKey = globalKey,
        _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        super(key: key);

  final GlobalKey<FormState> _globalKey;
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              validator: (value) {
                return value!.isEmpty ? 'Please Enter email' : null;
              },
              controller: _emailTextController,
              decoration:
                  buildInputFieldDecoration('Enter email', 'example@email.com'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              validator: (value) {
                return value!.isEmpty ? 'Please Enter Password' : null;
              },
              controller: _passwordTextController,
              obscureText: true,
              decoration:
                  buildInputFieldDecoration('Enter Password', 'Password'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  backgroundColor: Colors.amber,
                  textStyle: TextStyle(
                    fontSize: 18,
                  )),
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreenPage(),
                        ));
                  });
                }
              },
              child: Text('Sign In'))
        ],
      ),
    );
  }
}

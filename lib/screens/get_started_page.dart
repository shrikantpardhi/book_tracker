import 'package:book_tracker/widgets/create_account_form.dart';
import 'package:book_tracker/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CircleAvatar(
        backgroundColor: HexColor('#f5f6f8'),
        child: Column(children: [
          Spacer(),
          Text(
            'Book Tracker',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            '"Read, Change, Yourself"',
            style: TextStyle(
                fontSize: 29,
                color: Colors.black87,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          TextButton.icon(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: HexColor('#69639f'),
                  textStyle: TextStyle(fontSize: 18)),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              icon: Icon(Icons.login_rounded),
              label: Text('Sign In to read')),
          Spacer(),
        ]),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAccountClicked = false;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      child: Column(children: [
        Expanded(
            flex: 2,
            child: Container(
              color: HexColor('#b9c2d1'),
            )),
        Text(
          'Sign In',
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            SizedBox(
                width: 300,
                height: 350,
                child: isAccountClicked != true
                    ? LoginForm(
                        globalKey: _globalKey,
                        emailTextController: _emailTextController,
                        passwordTextController: _passwordTextController)
                    : CreateAccountForm(
                        globalKey: _globalKey,
                        emailTextController: _emailTextController,
                        passwordTextController: _passwordTextController)),
            TextButton.icon(
                icon: Icon(Icons.portrait_rounded),
                style: TextButton.styleFrom(
                    primary: HexColor('#fd5b28'),
                    textStyle:
                        TextStyle(fontSize: 18, fontStyle: FontStyle.italic)),
                onPressed: () {
                  setState(() {
                    if (!isAccountClicked) {
                      isAccountClicked = true;
                    } else {
                      isAccountClicked = false;
                    }
                  });
                },
                label: Text(isAccountClicked
                    ? 'Already have an account'
                    : 'Create Account'))
          ],
        ),
        Expanded(
            flex: 2,
            child: Container(
              color: HexColor('#b9c2d1'),
            )),
      ]),
    ));
  }
}

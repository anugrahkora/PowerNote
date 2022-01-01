import 'package:flutter/material.dart';
import 'package:power_note/components/app_logo.dart';
import 'package:power_note/components/login_cta_button.dart';
import 'package:power_note/components/text_input_field.dart';
import 'package:power_note/views/sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

final _formkey = GlobalKey<FormState>();

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    void unfocus() {
      FocusScopeNode currentFocus = FocusScope.of(context);

      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'Log in',
        style: TextStyle(fontSize: 30.0),
      ),
    );
    return GestureDetector(
      // onTap: () => unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBar,
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                appLogo(context, size),
                RoundedInputField(
                  hintText: 'Email',
                  onChanged: (val) {},
                ),
                RoundedInputField(
                  hintText: 'Password',
                  onChanged: (val) {},
                ),
                forgotPasswordText(context, size),
                LoginCTAButton(),
                signinText(context),
              ],
            ),
          ),
        )),
      ),
    );
  }

  Align forgotPasswordText(BuildContext context, Size size) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: EdgeInsets.only(right: size.width * 0.1),
        child: GestureDetector(
          onTap: () {},
          child: Text(
            'Forgot password?',
            style: TextStyle(
              fontSize: 13.0,
              fontWeight: FontWeight.w100,
              color: Theme.of(context).primaryTextTheme.bodyText1!.color,
            ),
          ),
        ),
      ),
    );
  }

  Padding signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account?',
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w100,
              color: Theme.of(context).primaryTextTheme.bodyText1!.color,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
            },
            child: Text(
              ' Sign up',
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

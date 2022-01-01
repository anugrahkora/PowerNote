import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:power_note/components/app_logo.dart';

import 'package:power_note/components/login_cta_button.dart';
import 'package:power_note/components/text_input_field.dart';

final _formkey = GlobalKey<FormState>();

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
        'Sign up',
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
              // mainAxisSize: MainAxisSize.max,
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // appLogo(context, size),
                SizedBox(
                  height: size.height * 0.1,
                ),
                RoundedInputField(
                  hintText: 'Name',
                  onChanged: (val) {},
                ),
                RoundedInputField(
                  hintText: 'Email',
                  onChanged: (val) {},
                ),
                RoundedInputField(
                  hintText: 'Password',
                  onChanged: (val) {},
                ),
                RoundedInputField(
                  hintText: 'Confirm Password',
                  onChanged: (val) {},
                ),
                LoginCTAButton(
                  text: 'Sign up',
                ),
                signinText(context, size),
              ],
            ),
          ),
        )),
      ),
    );
  }

  Padding signinText(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          divider(size, context),
          Text(
            'Or Sign up using',
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 15.0,
              color: Theme.of(context).primaryTextTheme.bodyText1!.color,
            ),
          ),
          divider(size, context),
        ],
      ),
    );
  }

  Container divider(Size size, BuildContext context) {
    return Container(
        height: 1.0,
        width: size.width * 0.3,
        color: Theme.of(context).highlightColor);
  }
}

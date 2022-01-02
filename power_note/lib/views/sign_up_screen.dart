import 'package:flutter/material.dart';
import 'package:power_note/api/backend_service.dart';

import 'package:power_note/components/login_cta_button.dart';
import 'package:power_note/components/text_input_field.dart';
import 'package:power_note/models/user_model.dart';

final _formkey = GlobalKey<FormState>();

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _textController = TextEditingController();
  final _confirmPassTextEditingController = TextEditingController();
  String? confirmPassword;
  User user = new User(
    uid: '12121212',
    name: '',
    email: '',
    password: '',
  );
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  // String? get _errorText {
  //   // at any time, we can get the text from _controller.value.text
  //   final text = _textController.value.text;
  //   final confirmPasstext = _confirmPassTextEditingController.value.text;
  //   // Note: you can do your own custom validation here
  //   // Move this logic this outside the widget for more testable code
  //   if (text.isEmpty) {
  //     return 'Can\'t be empty';
  //   }
  //   if (text.length < 4) {
  //     return 'Too short';
  //   }
  //   if (text != confirmPasstext) {
  //     return 'Too short';
  //   }
  //   // return null if the text is valid
  //   return null;
  // }

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
      onTap: () => unfocus(),
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
                  textEditingController: _textController,
                  hintText: 'Name',
                  onChanged: (val) {
                    setState(() {
                      user.name = val;
                    });
                  },
                ),
                RoundedInputField(
                  textEditingController: _textController,
                  hintText: 'Email',
                  onChanged: (val) {
                    setState(() {
                      user.email = val;
                    });
                  },
                ),
                RoundedInputField(
                  textEditingController: _textController,
                  hintText: 'Password',
                  onChanged: (val) {
                    setState(() {
                      user.password = val;
                    });
                  },
                ),
                RoundedInputField(
                  textEditingController: _textController,
                  hintText: 'Confirm Password',
                  // errorText: _errorText,
                  onChanged: (val) {
                    setState(() {
                      confirmPassword = val;
                    });
                  },
                  validator: (val) {
                    if (confirmPassword == user.password)
                      return null;
                    else
                      return 'Password doesn\'t match';
                  },
                ),
                LoginCTAButton(
                  text: 'Sign up',
                  onTap: () async {
                    // print(user);
                    await DBService().addUserToDB(user);
                    // print(response);
                  },
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

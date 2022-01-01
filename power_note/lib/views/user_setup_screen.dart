import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserSetupScreen extends StatelessWidget {
  const UserSetupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            applogo(size, context),
            welcomeText(size, context),
            // signup(size, context),
          ],
        ),
      ),
    );
  }

  Positioned signup(Size size, BuildContext context) {
    return Positioned(
      bottom: size.height * 0.1,
      child: Column(
        children: [
          customText(context, 'Sign up', 37),
          Container(
            height: size.height * 0.45,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(30),
              // shape: BoxShape.circle,
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(context, 'Hi,', 37),
                    customText(context, 'Welcome to ', 37),
                    customText(context, 'Power Note', 37),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Positioned welcomeText(Size size, BuildContext context) {
    return Positioned(
      bottom: size.height * 0.1,
      child: Container(
        height: size.height * 0.5,
        width: size.width * 0.9,
        // decoration: BoxDecoration(
        //   color: Theme.of(context).colorScheme.secondary,
        //   // shape: BoxShape.circle,
        // ),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText(context, 'Hi,', 37),
                customText(context, 'Welcome to ', 37),
                customText(context, 'Power Note', 37),
              ],
            )),
      ),
    );
  }

  Text customText(BuildContext context, String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryTextTheme.headline1!.color),
    );
  }

  Positioned applogo(Size size, BuildContext context) {
    return Positioned(
      top: size.height * 0.1,
      child: Container(
        // width: size.width * 0.5,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/icons/power_note_logo.svg',
            width: size.width * 0.35,
            height: size.width * 0.35,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}

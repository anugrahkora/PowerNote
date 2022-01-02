import 'package:flutter/material.dart';

class LoginCTAButton extends StatefulWidget {
  final Color color;
  final String text;
  final Function()? onTap;
  const LoginCTAButton({
    Key? key,
    this.color: Colors.white,
    this.text = 'Login',required this.onTap,
  }) : super(key: key);

  @override
  _LoginCTAButtonState createState() => _LoginCTAButtonState();
}

class _LoginCTAButtonState extends State<LoginCTAButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: widget.onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
            width: size.width * 0.9,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                const Color.fromARGB(255, 194, 71, 10),
                const Color.fromARGB(255, 225, 103, 42),
                const Color.fromARGB(255, 231, 134, 85),
              ]),
              // color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Text(
                  widget.text,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color:
                          Theme.of(context).primaryTextTheme.bodyText1!.color),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RoundedInputField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final Color? color;
  final bool boolean;
  final String? Function(String?)? validator;
  final textInputType;
  final Icon? prefixIcon;
  final String? errorText;
  final IconButton? suffixIcon;
  RoundedInputField({
    Key? key,
    this.hintText = 'Enter details',
    this.onChanged,
    this.color,
    this.boolean = false,
    this.validator,
    this.textInputType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    required this.textEditingController,
    this.errorText,
  }) : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: TextFieldContainer(
        hintText: widget.hintText,
        child: TextFormField(
          keyboardType: widget.textInputType,
          //  autofocus: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          cursorColor: Theme.of(context).colorScheme.secondary,
          validator: widget.validator,
          onChanged: widget.onChanged,
          obscureText: widget.boolean,
          style: TextStyle(
            color: Theme.of(context).primaryTextTheme.bodyText1!.color,
          ),
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).highlightColor, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            errorText: widget.errorText,
            errorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).errorColor, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).errorColor, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).focusColor, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatefulWidget {
  final Widget? child;
  final Color color;
  final String hintText;
  const TextFieldContainer({
    Key? key,
    this.child,
    this.color: Colors.white,
    this.hintText = 'Enter details',
  }) : super(key: key);

  @override
  _TextFieldContainerState createState() => _TextFieldContainerState();
}

class _TextFieldContainerState extends State<TextFieldContainer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: size.height * 0.015),
          child: Text(
            widget.hintText,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).primaryTextTheme.headline1!.color,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
          width: size.width * 0.9,
          // decoration: BoxDecoration(
          //   border: Border.all(
          //       color: Theme.of(context).colorScheme.secondary, width: 0.0),
          //   color: Theme.of(context).primaryColor,
          //   borderRadius: BorderRadius.circular(20.0),
          // ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: widget.child,
          ),
        ),
      ],
    );
  }
}

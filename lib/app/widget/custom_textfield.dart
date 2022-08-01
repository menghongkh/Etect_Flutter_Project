import 'package:flutter/material.dart';

typedef OnFieldSubmitted = void Function(String? value);
typedef OnChanged = void Function(String? value);

class Custom_Textfield extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? hintText;
  final OnFieldSubmitted? onFieldSubmitted;
  final OnChanged? onChanged;
  final FocusNode? focusNode;
  final int? maxLines;
  final bool expands;
  String? errorText;

  final bool errorState;
  Custom_Textfield({
    Key? key,
    this.controller,
    this.onFieldSubmitted,
    this.onChanged,
    this.errorText,
    this.focusNode,
    this.maxLines = 1,
    this.expands = false,
    this.errorState = false,
    this.hintText = '',
    this.textInputType = TextInputType.text,
    IconButton? iconButton,
  }) : super(key: key);

  static TextStyle defaultHintStyle = const TextStyle(
      color: Colors.black54, fontSize: 15.0, fontWeight: FontWeight.normal);
  static TextStyle defaultLabelStyle = const TextStyle(
      color: Colors.black54, fontSize: 15.0, fontWeight: FontWeight.normal);
  static InputBorder focusenabledDefaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.black,
      ));

  static InputBorder errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.red,
      ));
  static InputBorder focuserrorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.red,
      ));

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: textInputType,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          maxLines: maxLines,
          expands: expands,
          textAlignVertical: TextAlignVertical.top,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.black, width: 1.0)),
            focusedBorder: focusenabledDefaultBorder,
            hintText: hintText,
            focusedErrorBorder: focuserrorBorder,
            errorText: errorText,
            errorBorder: errorBorder,
            hintStyle: defaultHintStyle,
            labelStyle: defaultLabelStyle,
          )),
    );
  }
}

class PasswordField extends Custom_Textfield {
  final bool? isPasswordMatched;
  final IconButton? iconButton;
  final bool obscureText;
  final String? errorText;
  double? hight;
  double? width;

  PasswordField(
      {Key? key,
        this.hight,
        this.width,
        this.obscureText = true,
        this.iconButton,
        this.errorText,
        final TextEditingController? controller,
        final OnFieldSubmitted? onFieldSubmitted,
        final FocusNode? focusNode,
        final String? hintText = '',
        final OnChanged? onChanged,
        final bool errorState = false,
        this.isPasswordMatched = false})
      : super(
      key: key,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      errorState: errorState,
      controller: controller,
      hintText: hintText,
      focusNode: focusNode);
  static TextStyle defaultHintStyle = const TextStyle(
      color: Colors.black54, fontSize: 14.0, fontWeight: FontWeight.normal);
  static InputBorder enabledDefaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.black));
  static InputBorder customErrorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.red));
  static InputBorder focuserrorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.red,
      ));
  @override
  Widget build(BuildContext context) {
    return Container(
      height: hight,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
          obscureText: obscureText,
          controller: controller,
          focusNode: focusNode,
          keyboardType: TextInputType.text,
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            errorText: errorText,
            contentPadding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            hintText: hintText,
            hintStyle: defaultHintStyle,
            counterText: '',
            errorBorder: customErrorBorder,
            focusedErrorBorder: focuserrorBorder,
            enabledBorder: isPasswordMatched!
                ? PasswordMatchedOutlineBorder.instance.border
                : errorState
                ? customErrorBorder
                : enabledDefaultBorder,
            focusedBorder: isPasswordMatched!
                ? PasswordMatchedOutlineBorder.instance.border
                : Custom_Textfield.focusenabledDefaultBorder,
            suffixIcon: iconButton,
          )),
    );
  }
}

class PasswordMatchedOutlineBorder {
  PasswordMatchedOutlineBorder._();

  static PasswordMatchedOutlineBorder? _border;
  static PasswordMatchedOutlineBorder get instance {
    if (_border == null) {
      return _border = PasswordMatchedOutlineBorder._();
    } else {
      return _border!;
    }
  }

  InputBorder get border {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(10.0));
  }
}

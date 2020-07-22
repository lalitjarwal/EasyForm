import 'package:flutter/material.dart';

class NumberField extends StatelessWidget {
  final Key key;
  final String hint;
  final Icon icon;
  final String lable;
  final String errorString;
  final TextEditingController controller;
  final Color themeColor;
  final double borderRadius;
  final Function onTap;
  final double textSize;
  final Function onEditingComplete;
  final String Function(String) validator;
  const NumberField(
      {this.key,
      this.lable = 'Phone Number',
      this.hint = 'Enter Phone Number',
      this.icon = const Icon(Icons.phone),
      this.errorString = '*Please enter valid Phone Number',
      this.controller,
      this.textSize = 18.0,
      this.themeColor = Colors.black,
      this.borderRadius = 4.0,
      this.onTap,
      this.onEditingComplete,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: key,
        autovalidate: true,
        child: Theme(
          data: ThemeData(primaryColor: themeColor, cursorColor: themeColor),
          child: TextFormField(
            onTap: onTap,
            key: key,
            style: TextStyle(
              fontSize: textSize,
            ),
            controller: controller,
            keyboardType: TextInputType.phone,
            onEditingComplete: onEditingComplete,
            validator: (value) {
              String pattern = r'^[6789]\d{9}$';
              RegExp reg = RegExp(pattern);
              if (value.length == 0) {
                return '*Mobile Number required!';
              } else if (!reg.hasMatch(value)) {
                return '$errorString';
              }
              return null;
            },
            decoration: InputDecoration(
                labelText: lable,
                prefixIcon: icon,
                hintText: hint,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                )),
          ),
        ),
      ),
    );
  }
}

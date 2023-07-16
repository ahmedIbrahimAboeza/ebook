import 'package:ebook/constance.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      required this.controller,
      this.labeltext,
      this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      required this.borderradius,
      required this.obsecure,
      required this.onsubmit,
      this.onChange,
      this.validator,
      required this.keyboardtype,
      this.border})
      : super(key: key);
  final TextEditingController controller;
  final String? labeltext;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double borderradius;
  final bool obsecure;
  ValueChanged<String>? onsubmit;
  ValueChanged<String>? onChange;

  final FormFieldValidator<String>? validator;
  final TextInputType keyboardtype;
  final OutlineInputBorder? border;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardtype,
      validator: validator,
      style: TextStyle(
        fontSize: 16,
        color: isDark ? Colors.white : Colors.red,
      ),
      decoration: InputDecoration(
          fillColor: isDark ? Colors.white : Colors.red,
          labelText: labeltext,
          hintText: hintText,
          prefixIcon: prefixIcon,
          hintStyle: TextStyle(
            color: isDark ? Colors.white : Colors.red,
          ),
          suffixIconColor: isDark ? Colors.white : Colors.red,
          prefixIconColor: isDark ? Colors.white : Colors.red,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: isDark ? Colors.white : Colors.red),
              borderRadius: BorderRadius.circular(
                borderradius,
              )),
          suffixIcon: suffixIcon),
      obscureText: obsecure,
      onFieldSubmitted: onsubmit,
      onChanged: onChange,
    );
  }
}

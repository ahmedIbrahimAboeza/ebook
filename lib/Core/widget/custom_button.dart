import 'package:flutter/material.dart';

import '../utiles/Style.dart';

class Custom_button extends StatelessWidget {
  const Custom_button(
      {Key? key,
      required this.backgrounColor,
      // ignore: non_constant_identifier_names
      required this.TextColor,
      required this.text_button,
      required int border,
      required int height,
      required int width})
      : super(key: key);
  final Color backgrounColor;
  final Color TextColor;
  final String text_button;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: backgrounColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          onPressed: () {},
          child: Text(
            text_button,
            style: Styles.textStyle18
                .copyWith(color: TextColor, fontWeight: FontWeight.w900),
          )),
    );
  }
}

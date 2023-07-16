import 'package:flutter/material.dart';

import 'View/Screen/Sign/login_screen.dart';

String? token;

void signOut(context) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
}

const kPrimaryDark = Color(0xff8276ff);
const kPrimarylight = Color(0xffe65c4d);

const kbackgroundDarkColor = Color(0xff04012b);
const kbackgroundlightColor = Color(0xffe9eef2);
const kTranstionDuration = Duration(milliseconds: 250);
const kGtSectraFine = 'GT Sectra Fine';
// ignore: constant_identifier_names
const BlackadderITC = 'Blackadder iTC';
var isDark = true;

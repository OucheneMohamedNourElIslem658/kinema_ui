import 'package:flutter/material.dart';
import 'package:get/get.dart';

void push (BuildContext context, Widget screen) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => screen,
    )
  );
}

void pop(BuildContext context,{GetxController? controller}) {
  if (controller != null) {
    controller.dispose();
  }
  Navigator.of(context).pop();
}

void pushOfAll(BuildContext context, Widget screen) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => screen,
    ),
    (route) => false,
  );
}

void pushOf(BuildContext context, Widget screen) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(
      builder: (context) => screen,
    )
  );
}
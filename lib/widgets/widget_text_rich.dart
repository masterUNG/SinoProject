// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetTextRich extends StatelessWidget {
  const WidgetTextRich({
    Key? key,
    required this.head,
    required this.value,
    this.colorTextValue,
    this.colorTextHead,
  }) : super(key: key);

  final String head;
  final String value;
  final Color? colorTextValue;
  final Color? colorTextHead;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
          text: head,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: colorTextHead ?? Colors.amber),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: colorTextValue ?? Colors.white),
            ),
          ]),
    );
  }
}

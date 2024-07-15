import 'package:flutter/material.dart';

class WidgetMenu extends StatelessWidget {
  const WidgetMenu({
    Key? key,
    required this.title,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(iconData),
      onTap: onTap,
    );
  }
}

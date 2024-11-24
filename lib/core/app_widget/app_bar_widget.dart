import 'package:flutter/material.dart';
import 'app_text.dart';

AppBar appBarWidget({
  required BuildContext context,
  required String textTitle,
  bool isCenterTitle = true,
  Widget? leadingWidget,
  Color? color,
  List<Widget>? actionWidgets,
}) {
  return AppBar(
    backgroundColor: color,
    centerTitle: isCenterTitle,
    leading: leadingWidget,
    title: AppText(
      text: textTitle,
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    actions: actionWidgets,
  );
}

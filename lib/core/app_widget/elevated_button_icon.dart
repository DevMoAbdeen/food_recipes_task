import 'package:flutter/material.dart';
import 'app_text.dart';

class ElevatedButtonIcon extends StatelessWidget {
  final VoidCallback onCLickButton;
  final String text;
  final IconData iconData;

  const ElevatedButtonIcon({
    super.key,
    required this.onCLickButton,
    required this.text,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => onCLickButton(),
      icon: Icon(
        iconData,
        color: Colors.white,
      ),
      label: AppText(
        text: text,
        fontSize: 16,
        color: Colors.white,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        textStyle: const TextStyle(fontSize: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

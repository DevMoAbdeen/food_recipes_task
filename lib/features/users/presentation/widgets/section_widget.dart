import 'package:flutter/material.dart';
import '../../../../core/app_widget/app_text.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final List<Widget> widgets;

  const SectionWidget({
    super.key,
    required this.title,
    required this.widgets,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: AppText(
            text: title,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Card.outlined(
          color: Theme.of(context).cardColor,
          child: Column(children: widgets),
        )
      ],
    );
  }
}

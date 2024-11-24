import 'package:flutter/material.dart';
import '../../../../core/app_widget/app_text.dart';

class ListTileWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const ListTileWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).primaryColor,
      ),
      title: AppText(
        text: title,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      subtitle: AppText(
        text: subtitle,
        maxLines: 2,
        fontSize: 14,
        color: Theme.of(context).hintColor,
      ),
    );
  }
}

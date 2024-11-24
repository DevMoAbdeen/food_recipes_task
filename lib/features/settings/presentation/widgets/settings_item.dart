import 'package:flutter/material.dart';
import '../../../../core/app_widget/app_text.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Widget? trailingWidget;
  final VoidCallback? onTap;

  const SettingsItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.trailingWidget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: AppText(text: title, fontSize: 18, fontWeight: FontWeight.w700),
      subtitle: AppText(text: subtitle, fontSize: 15, color: Theme.of(context).hintColor),
      trailing: trailingWidget ?? (onTap != null ? const Icon(Icons.arrow_forward_ios) : null),
      onTap:() => onTap != null ? onTap!() : null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/app_widget/app_text.dart';
import '../../../../core/constant/app_images.dart';

class ContactWithMeWidget extends StatelessWidget {
  final String appIcon;
  final String appName;
  final String myAppLink;

  const ContactWithMeWidget({
    super.key,
    required this.appIcon,
    required this.appName,
    required this.myAppLink,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () async {
        await launchUrl(Uri.parse(myAppLink));
      },
      leading: SvgPicture.asset(
        appIcon,
        width: appIcon == AppImages.github ? 30 : 40,
        height: appIcon == AppImages.github ? 30 : 40,
      ),
      title: AppText(text: appName, fontSize: 16),
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}

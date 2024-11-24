import 'package:flutter/material.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/extensions/translation_extension.dart';
import '../../../../features/food/presentation/widgets/network_image_widget.dart';
import '../../../../core/app_widget/app_text.dart';
import '../../../../core/app_widget/elevated_button_icon.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/extensions/navigation_extension.dart';
import '../../../../core/routing/router_list.dart';
import '../../domain/entities/user_data.dart';


class UserWidget extends StatelessWidget {
  final UserData user;

  const UserWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: NetworkImageWidget(imageUrl: user.image ?? "", width: 60, height: 60),
                ),
                15.widthSpace(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "${user.firstName} ${user.lastName}",
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    AppText(
                      text: user.email ?? "null",
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).hintColor,
                    ),
                    5.heightSpace(),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 18,
                          color: Colors.redAccent,
                        ),
                        5.widthSpace(),
                        AppText(
                          text: user.address?.city ?? "",
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: "${TranslationKeys.age.translateValue()}: ${user.age}",
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
                AppText(
                  text: "${TranslationKeys.role.translateValue()}: ${user.role}",
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ],
            ),
            10.heightSpace(),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButtonIcon(
                iconData: Icons.remove_red_eye,
                text: TranslationKeys.viewDetails.translateValue(),
                onCLickButton: () {
                  context.pushNamed(RouterList.userDetailsScreen, arguments: user);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
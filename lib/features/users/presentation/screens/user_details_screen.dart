import 'package:flutter/material.dart';
import '../../../../core/extensions/translation_extension.dart';
import '../../../../core/app_widget/app_bar_widget.dart';
import '../../../../core/constant/translation_keys.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import '../../../../core/app_widget/app_text.dart';
import '../../../../core/extensions/navigation_extension.dart';
import '../../../food/presentation/widgets/network_image_widget.dart';
import '../../domain/entities/user_data.dart';
import '../widgets/list_tile_widget.dart';
import '../widgets/section_widget.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late UserData userData;
    try {
      UserData? argumentUser = ModalRoute.of(context)?.settings.arguments as UserData;
      userData = argumentUser;
    } catch (e) {
      context.pop();
    }

    return Scaffold(
      appBar: appBarWidget(context: context, textTitle: "${userData.firstName} ${userData.lastName}"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Information Card
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              margin: const EdgeInsets.only(bottom: 10),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    NetworkImageWidget(imageUrl: userData.image ?? "", width: 70, height: 70),
                    10.widthSpace(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "${userData.firstName} ${userData.maidenName} ${userData.lastName}",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            maxLines: 2,
                            color: Theme.of(context).primaryColor,
                          ),
                          AppText(
                            text: userData.email ?? "",
                            fontSize: 14,
                            maxLines: 2,
                            color: Theme.of(context).hintColor,
                          ),
                          5.heightSpace(),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 20,
                                color: Colors.redAccent,
                              ),
                              5.widthSpace(),
                              AppText(
                                text: userData.address?.city ?? "",
                                maxLines: 1,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Personal Information
            SectionWidget(
              title: TranslationKeys.personalInformation.translateValue(),
              widgets: [
                ListTileWidget(
                  title: TranslationKeys.username.translateValue(),
                  subtitle: userData.username ?? "",
                  icon: Icons.account_circle,
                ),
                ListTileWidget(
                  title: TranslationKeys.phone.translateValue(),
                  subtitle: userData.phone ?? "",
                  icon: Icons.phone,
                ),
                ListTileWidget(
                  title: TranslationKeys.age.translateValue(),
                  subtitle: "${userData.age}",
                  icon: Icons.calendar_month,
                ),
                ListTileWidget(
                  title: TranslationKeys.gender.translateValue(),
                  subtitle: userData.gender ?? "",
                  icon: Icons.wc,
                ),
                ListTileWidget(
                  title: TranslationKeys.bloodGroup.translateValue(),
                  subtitle: userData.bloodGroup ?? "",
                  icon: Icons.medical_services,
                ),
              ],
            ),

            // Address Information
            SectionWidget(
              title: TranslationKeys.addressInformation.translateValue(),
              widgets: [
                ListTileWidget(
                  title: TranslationKeys.address.translateValue(),
                  subtitle: "${userData.address?.address}, ${userData.address?.city}",
                  icon: Icons.location_city,
                ),
                ListTileWidget(
                  title: TranslationKeys.state.translateValue(),
                  subtitle: userData.address?.state ?? "",
                  icon: Icons.map,
                ),
                ListTileWidget(
                  title: TranslationKeys.postalCode.translateValue(),
                  subtitle: userData.address?.postalCode ?? "",
                  icon: Icons.mail,
                ),
              ],
            ),

            // Bank Information
            SectionWidget(
              title: TranslationKeys.bankInformation.translateValue(),
              widgets: [
                ListTileWidget(
                  title: TranslationKeys.cardType.translateValue(),
                  subtitle: userData.bank?.cardType ?? "",
                  icon: Icons.credit_card,
                ),
                ListTileWidget(
                  title: TranslationKeys.cardExpiration.translateValue(),
                  subtitle: userData.bank?.cardExpire ?? "",
                  icon: Icons.date_range,
                ),
                ListTileWidget(
                  title: TranslationKeys.iban.translateValue(),
                  subtitle: userData.bank?.iban ?? "",
                  icon: Icons.account_balance_wallet,
                ),
              ],
            ),

            // University And Role Information
            SectionWidget(
              title: TranslationKeys.universityAndRole.translateValue(),
              widgets: [
                ListTileWidget(
                  title: TranslationKeys.university.translateValue(),
                  subtitle: userData.university ?? "",
                  icon: Icons.school,
                ),
                ListTileWidget(
                  title: TranslationKeys.role.translateValue(),
                  subtitle: userData.role ?? "",
                  icon: Icons.badge,
                ),
              ],
            ),

            // Crypto Information
            SectionWidget(
              title: TranslationKeys.cryptoInformation.translateValue(),
              widgets: [
                ListTileWidget(
                  title: TranslationKeys.coin.translateValue(),
                  subtitle: userData.crypto?.coin ?? "",
                  icon: Icons.monetization_on,
                ),
                ListTileWidget(
                  title: TranslationKeys.wallet.translateValue(),
                  subtitle: userData.crypto?.wallet ?? "",
                  icon: Icons.wallet_travel,
                ),
                ListTileWidget(
                  title: TranslationKeys.network.translateValue(),
                  subtitle: userData.crypto?.network ?? "",
                  icon: Icons.network_wifi,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

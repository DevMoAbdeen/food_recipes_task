import 'package:flutter/material.dart';
import '../../../../core/extensions/sized_box_extension.dart';
import 'user_widget.dart';
import '../../domain/entities/user_data.dart';

class UsersListViewWidget extends StatelessWidget {
  final List<UserData> users;
  final bool isLoadingMore;

  const UsersListViewWidget({
    super.key,
    required this.users,
    required this.isLoadingMore,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length + 1,
      cacheExtent: 100,
      itemBuilder: (context, index) {
        if (index == users.length) {
          return isLoadingMore
              ? const SizedBox(height: 50, child: Center(child: CircularProgressIndicator()))
              : 0.heightSpace();
        }

        return UserWidget(user: users[index]);
      },
    );
  }
}

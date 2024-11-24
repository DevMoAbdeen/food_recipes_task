import 'package:food_recipes_task/features/users/domain/entities/user_data.dart';

class UsersResponse {
  final List<UserData>? users;
  final int? total;
  final int? skip;
  final int? limit;

  UsersResponse({
    required this.users,
    required this.total,
    required this.skip,
    required this.limit,
  });
}

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/user_data.dart';
import '../../../domain/use_cases/get_users_use_case.dart';
import '../states/users_states.dart';

class UsersCubit extends Cubit<UsersStates> {
  final GetUsersUseCase _getUsersUseCase;

  UsersCubit({required GetUsersUseCase getUsersUseCase})
      : _getUsersUseCase = getUsersUseCase,
        super(UsersLoading());

  List<UserData> _users = [];

  List<UserData> get getUsersList => _users;
  int _skip = 0;
  late int _total;
  final int _limit = 10;

  bool isLoadingData = false;

  getUsers() async {
    if (state is! UsersLoading) {
      emit(UsersLoading());
    }
    final usersResult = await _getUsersUseCase(_skip, _limit);
    usersResult.fold(
      (failure) {
        emit(UsersError(errorMessage: failure.message));
      },
      (usersResponse) {
        _users = usersResponse.users!;
        _total = usersResponse.total!;
        _skip = _users.length;
        emit(UsersLoaded());
      },
    );
  }

  getMoreRecipes() async {
    if (_users.length < _total && !isLoadingData) {
      isLoadingData = true;
      emit(GetMoreUsersLoading());
      final usersResult = await _getUsersUseCase(_skip, _limit);
      isLoadingData = false;

      usersResult.fold(
        (failure) {
          emit(GetMoreUsersError(errorMessage: failure.message));
        },
        (usersResponse) {
          List<UserData> newUsers = usersResponse.users!;
          _users.addAll(newUsers);
          _skip = _users.length;
          emit(UsersLoaded());
        },
      );
    }
  }
}

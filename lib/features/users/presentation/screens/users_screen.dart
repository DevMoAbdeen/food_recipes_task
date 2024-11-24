import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_widget/error_display_widget.dart';
import '../../../../core/shimmers/app_widgets/shimmer_user.dart';
import '../../../page_view/presentation/controller/cubits/bottom_nav_cubit.dart';
import '../controller/cubits/users_cubit.dart';
import '../controller/states/users_states.dart';
import '../widgets/users_list_view_widget.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersStates>(
      builder: (context, state) {
        final cubit = context.read<UsersCubit>();

        if(state is UsersError){
          return ErrorDisplayWidget(
            errorMessage: state.errorMessage,
            onRetry: () => cubit.getUsers(),
          );
        }
        if(state is UsersLoading){
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => const ShimmerUser(),
          );
        }

        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo is ScrollUpdateNotification && scrollInfo.metrics.axis == Axis.vertical) {
              if (scrollInfo.scrollDelta! < -15) {
                context.read<BottomNavCubit>().changeBottomNavVisible(true);
              }
              if (scrollInfo.scrollDelta! > 10) {
                context.read<BottomNavCubit>().changeBottomNavVisible(false);
              }
            }

            if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
              cubit.getMoreRecipes();
            }
            return true;
          },
          child: UsersListViewWidget(
            users: cubit.getUsersList,
            isLoadingMore: state is GetMoreUsersLoading,
          ),
        );
      },
    );
  }
}

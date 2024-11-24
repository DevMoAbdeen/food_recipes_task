import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/app_widget/error_display_widget.dart';
import '../../../../core/shimmers/app_widgets/shimmer_recipe.dart';
import '../../../page_view/presentation/controller/cubits/bottom_nav_cubit.dart';
import '../controller/cubits/recipes_cubit.dart';
import '../controller/states/recipes_states.dart';
import '../widgets/recipes_list_view_widget.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesCubit, RecipesStates>(
      builder: (context, state) {
        final cubit = context.read<RecipesCubit>();

        if(state is RecipesError){
          return ErrorDisplayWidget(
            errorMessage: state.errorMessage,
            onRetry: () => cubit.getRecipes(),
          );
        }
        if(state is RecipesLoading){
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => const ShimmerRecipe(),
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
          child: RecipesListViewWidget(
            recipes: cubit.getRecipesList,
            isLoadingMore: state is GetMoreRecipesLoading,
          ),
        );
      },
    );
  }
}

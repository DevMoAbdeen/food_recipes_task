import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../features/authentication/data/data_sources/login_remote_data_source.dart';
import '../../features/authentication/data/repositories/login_repository_impl.dart';
import '../../features/authentication/domain/repositories/login_repository.dart';
import '../../features/authentication/domain/use_cases/login_use_case.dart';
import '../../features/authentication/presentation/controller/cubits/login_cubit.dart';
import '../../features/food/data/data_sources/recipes_local_data_source.dart';
import '../../features/food/data/data_sources/recipes_remote_data_source.dart';
import '../../features/food/data/repositories/recipes_repository_impl.dart';
import '../../features/food/domain/repositories/recipes_repository.dart';
import '../../features/food/domain/use_cases/get_recipes_use_case.dart';
import '../../features/food/presentation/controller/cubits/recipes_cubit.dart';
import '../../features/page_view/presentation/controller/cubits/bottom_nav_cubit.dart';
import '../../features/settings/presentation/controller/cubits/settings_cubit.dart';
import '../../features/splash/presentation/controller/cubit/splash_cubit.dart';
import '../../features/users/data/data_sources/users_local_data_source.dart';
import '../../features/users/data/data_sources/users_remote_data_source.dart';
import '../../features/users/data/repositories/users_repository_impl.dart';
import '../../features/users/domain/repositories/users_repository.dart';
import '../../features/users/domain/use_cases/get_users_use_case.dart';
import '../../features/users/presentation/controller/cubits/users_cubit.dart';
import '../../infrastructure/shared_preferences.dart';
import '../networking/api/http_controller.dart';
import '../networking/internet/internet_connection.dart';
import '../observer/bloc_observer.dart';

GetIt getIt = GetIt.instance;

// registerSingleton => create object when open app
// registerLazySingleton => create object when need it

Future<void> setupServiceLocator() async {

  /// External ///
  getIt.registerSingleton<SharedPrefController>(SharedPrefController());
  getIt.registerLazySingleton(() => InternetConnectionChecker());

  /// /////////////////////////////////////////////////////////////////// ///

  /// Core ///
  await getIt<SharedPrefController>().init();
  getIt.registerLazySingleton<InternetConnection>(() => InternetConnectionImp(getIt()));
  // getIt.registerLazySingleton(() => ApiController);
  getIt.registerLazySingleton(() => HttpController());

  // Observers
  Bloc.observer = MyBlocObserver();

  /// ///////////////////////////////////////////////////////////////////

  /// Features (Splash)
  // Cubits //
  getIt.registerLazySingleton(() => SplashCubit());

  ////////////////////////////////////////////////////

  /// Features (Authentication)
  // Cubits //
  getIt.registerLazySingleton(() => LoginCubit(loginUseCase: getIt()));

  // UseCases //
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));

  // Repository //
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
      remoteDataSource: getIt(), internetConnection: getIt()));

  // DataSources //
  getIt.registerLazySingleton<LoginRemoteDataSource>(() =>
      LoginRemoteDataSourceImplWithHttp(apiController: getIt<HttpController>()),);

  ////////////////////////////////////////////////////

  /// Features (Page View)
  // Cubits //
  getIt.registerLazySingleton(() => BottomNavCubit());

  ////////////////////////////////////////////////////

  /// Features (Recipes)
  // Cubits //
  getIt.registerLazySingleton(() => RecipesCubit(getRecipesUseCase: getIt()));

  // UseCases //
  getIt.registerLazySingleton(() => GetRecipesUseCase(getIt()));

  // Repository //
  getIt.registerLazySingleton<RecipesRepository>(() => RecipesRepositoryImpl(
      remoteDataSource: getIt(), localDataSource: getIt(), internetConnection: getIt()));

  // DataSources //
  getIt.registerLazySingleton<RecipesRemoteDataSource>(() =>
      RecipesRemoteDataSourceImplWithHttp(apiController: getIt<HttpController>()),);
  getIt.registerLazySingleton<RecipesLocalDataSource>(() =>
      RecipesLocalDataSourceImplWithSharedPref(sharedPref: getIt<SharedPrefController>()),);

  ////////////////////////////////////////////////////

  /// Features (Users)
  // Cubits //
  getIt.registerLazySingleton(() => UsersCubit(getUsersUseCase: getIt()));

  // UseCases //
  getIt.registerLazySingleton(() => GetUsersUseCase(getIt()));

  // Repository //
  getIt.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl(
      remoteDataSource: getIt(), localDataSource: getIt(), internetConnection: getIt()));

  // DataSources //
  getIt.registerLazySingleton<UsersRemoteDataSource>(() =>
      UsersRemoteDataSourceImplWithHttp(apiController: getIt<HttpController>()),);
  getIt.registerLazySingleton<UsersLocalDataSource>(() =>
      UsersLocalDataSourceImplWithSharedPref(sharedPref: getIt<SharedPrefController>()),);

  ////////////////////////////////////////////////////

  /// Features (Settings)
  // Cubits //
  getIt.registerLazySingleton(() => SettingsCubit());

}
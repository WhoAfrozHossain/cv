import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cv/core/database/localDb/localDBFuncation.dart';
import 'package:cv/core/database/localDb/localDatabaseHelper.dart';
import 'package:cv/core/network/network_info.dart';
import 'package:cv/features/frontend/data/datasource/frontend_remote_data_source.dart';
import 'package:cv/features/frontend/data/repositories/frontend_repository_impl.dart';
import 'package:cv/features/frontend/domain/repository/frontend_repository.dart';
import 'package:cv/features/frontend/domain/usecase/frontend_use_case.dart';
import 'package:cv/features/frontend/screens/bloc/frontend_bloc.dart';
import 'package:cv/features/frontend/screens/function/frontend_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/apphelper/app_helper.dart';
import 'main.dart';

Future intiGetIt() async {
  sl.registerSingleton<AppNetworkInfo>(NetworkInfoImpl(Connectivity()));

  // Use Case
  sl.registerLazySingleton(
    () => FrontendUseCase(
      frontendRepository: FrontendRepositoryImpl(
        appNetworkInfo: sl(),
        frontendRemoteDataSource: sl(),
      ),
    ),
  );

  // Bloc
  sl.registerLazySingleton<FrontendBloc>(
      () => FrontendBloc(frontendUseCase: sl()));

  // Repository Implement
  sl.registerLazySingleton<FrontendRepository>(() => FrontendRepositoryImpl(
      appNetworkInfo: sl(), frontendRemoteDataSource: sl()));

  // Function class
  sl.registerLazySingleton(() => FrontendFunctions());

  // Data source
  sl.registerLazySingleton<FrontendRemoteDataSource>(
      () => FrontendRemoteDataSourceImpl());

  //local database
  sl.registerLazySingleton<LocalDBFunctions>(() => LocalDbFunctionImpl());
  sl.registerLazySingleton(
      () => AppLocalDatabaseHelper(localDBFunctions: sl()));

  // necessary classes
  sl.registerLazySingleton(() => AppHelper());

  // external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}

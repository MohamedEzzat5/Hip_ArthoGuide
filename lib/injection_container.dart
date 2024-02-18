import 'package:get_it/get_it.dart';
import 'package:physical_therapy_app/Features/auth/data/repos/auth_repo.dart';
import 'package:physical_therapy_app/Features/auth/data/repos/auth_repo_impl.dart';
import 'package:physical_therapy_app/Features/auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:physical_therapy_app/Features/auth/presentation/manger/register_cubit/register_cubit.dart';





final sl = GetIt.instance;

Future<void> init() async {
//! features
  //Blocs
  sl.registerFactory(() => RegisterCubit(authRepo: sl()));
  sl.registerFactory(() => LoginCubit(authRepo: sl()));

  //use Cases
  // sl.registerLazySingleton(() => GetRandomQuote(quoteRepository: sl()));
  // Repository
    sl.registerLazySingleton<AuthRepo>(() => AuthRepoImplementation());
  //Data Sources
  // sl.registerLazySingleton<RandomQuoteLocalDataSource>(() => RandomQuoteLocalDataSourceImpl(sharedPreferences: sl()));
  // sl.registerLazySingleton<RandomQuoteRemoteDataSource>(() => RandomQuoteRemoteDataSourceImpl(client:  sl()));

//!core
  //network info
  // sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker: sl()));


//! External
// final sharedPreferences = await SharedPreferences.getInstance();
// sl.registerLazySingleton(() => sharedPreferences);
// sl.registerLazySingleton(() => InternetConnectionChecker());
}
import 'package:bookly_app_tharwat/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_tharwat/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  //getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImplementation>( HomeRepoImplementation(getIt.get<ApiService>()));
}

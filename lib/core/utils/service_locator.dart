import 'package:bookly_app_tharwat/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app_tharwat/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app_tharwat/core/utils/api_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final gitIt = GetIt.instance;

void setupServiceLocator() {
  gitIt.registerSingleton<Dio>(Dio());
  gitIt.registerSingleton<ApiService>(ApiService(gitIt.get<Dio>()));
  gitIt.registerSingleton<HomeRepo>(HomeRepoImplementation(gitIt.get<ApiService>()));
}
